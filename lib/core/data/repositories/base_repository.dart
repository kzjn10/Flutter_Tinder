import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:tinder/core/data/base/base_result_entity.dart';
import 'package:tinder/core/domain/contants/global.dart';
import 'package:tinder/core/domain/errors/fetch_data_exception.dart';
import 'package:tinder/core/services/logger/logger_manager.dart';

import '../../client_core_config.dart';
import 'appClientData/app_data_repository_i.dart';
//import 'cached/cache_manager.dart';

class BaseRepository<T extends BaseResultEntity> {
  final _encoder = JsonEncoder();

  String get key => ClientCoreConfig.KEY;

  ILoggerManager get logger => ClientCoreConfig().logger;

//  CacheManager get _cache => ClientCoreConfig().cached;

  Client get _client => ClientCoreConfig().client;

  ApplicationInfo get _appInfo => ClientCoreConfig().appInfo;

  IAppClientDataRepository get _appDataRepository => ClientCoreConfig().repositoryInjector.appClientDataRepository;

  BaseRepository();

  String get baseUrl => ClientCoreConfig().repositoryInjector.getBaseUrl();

  Future<Map<String, String>> _getHeaders([bool isMultipart = false]) async {
    return Map();
  }

  Future<Response> onRequestTimeout(url) {
    print("Request timeout: $url");
    return null;
  }

  Duration getHttpTimeOut() {
    return Duration(seconds: 30);
  }

  Future<T> processResponse(Response response, String cacheId, bool useMemCache) async {
    if (response == null) return null;

    final String _body = response.body;
    final int _statusCode = response.statusCode;

    if (_statusCode < 200 || _statusCode > 400) {
      throw FetchDataException("An error ocurred : [Status Code : $_statusCode]", response.request.url.toString());
    } else {
      final BaseResultEntity _result = parseResult(_body);

      if (_result == null) {
        throw FetchDataException("An error while trying parse response", response.request.url.toString());
      }

      if (_result.code == null) {
        throw FetchDataException("Invalid response: respone without statusCode", response.request.url.toString());
      }

      switch (_result.code) {
        case StatusCodes.SUCCESS:
          if (useMemCache && cacheId != null) {
            log("MemCache", "SET cacheId: $cacheId");
//            _cache.set(cacheId, _result);
          }
          return _result;
        default:
          throw FetchDataException(
            "Unknow error code ${_result.code} - with message: ${_result.message}",
            response.request.url.toString(),
          );
      }
    }
  }

  Future<dynamic> processStreamResponse(StreamedResponse response) {
    Completer _completer = Completer();
    if (response.statusCode != 200) {
      _completer.complete(null);
    } else {
      response.stream.transform(utf8.decoder).listen((value) async {
//        print(value);
        BaseResultEntity result = parseResult(value);
        _completer.complete(result);
      });
    }

    return _completer.future;
  }

  void log(String tag, String msg) {
    logger?.log(tag, msg);
  }

  String _normalizeBody(Map<String, dynamic> body) => body != null ? _encoder.convert(body) : null;

  Future<dynamic> get(String url, [Map<String, dynamic> params, bool clearHttpCache = false, bool useMemCache = false]) async {
    Map<String, dynamic> _params = {};

    var _cacheId;

    if (params == null) {
      params = Map();
    }

    //check data in cache if the request require to use mem cache
    if (useMemCache) {
      _cacheId = url +
          "?" +
          params.keys.map((k) {
            if (k is Map) {
              return '$k=${Uri.encodeComponent(params[k])}';
            }
            return '$k=${params[k]}';
          }).join("&");

      final _result = null; //await _cache?.get(_cacheId);

      if (_result != null) {
        log("MemCache", "GET cacheId: $_cacheId");
        return _result;
      }
    }

    if (clearHttpCache) {
      _params['_t'] = DateTime.now().millisecondsSinceEpoch.toString();
    }

    _params.addAll(params);

    log('HTTP.get', url);

    Response _response = await _client
        .get(
          Uri.encodeFull(url),
          headers: await _getHeaders(),
        )
        .timeout(
          getHttpTimeOut(),
          onTimeout: () => onRequestTimeout(url),
        );

    return processResponse(_response, _cacheId, useMemCache);
  }

  Future<dynamic> post(String url, [Map<String, dynamic> data]) async {
    log('HTTP.post', url);
    Response response = await _client
        .post(
          Uri.encodeFull(url),
          body: _normalizeBody(data),
          headers: await _getHeaders(),
        )
        .timeout(
          getHttpTimeOut(),
          onTimeout: () => onRequestTimeout(url),
        );

    return processResponse(response, null, false);
  }

  Future<dynamic> put(String url, [Map<String, dynamic> data]) async {
    log('HTTP.put', url);
    Response _response = await _client
        .put(
          Uri.encodeFull(url),
          body: _normalizeBody(data),
          headers: await _getHeaders(),
        )
        .timeout(
          getHttpTimeOut(),
          onTimeout: () => onRequestTimeout(url),
        );

    return processResponse(_response, null, false);
  }

  BaseResultEntity parseResult(String jsonData) {
    try {
      final mapData = json.decode(jsonData);
      return BaseResultEntity.fromJson(mapData);
    } catch (e) {
      print("BaseRequest error: parseResult");
      print(e);
      return null;
    }
  }
}
