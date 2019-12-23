import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:tinder/core/services/base/base_api_service.dart';
import 'package:tinder/core/services/logger/logger_manager.dart';
import 'package:tinder/core/services/logger/logger_manager_impl.dart';

import 'contants/global.dart';
import 'data/repositories/appClientData/app_data_repository_i.dart';
import 'injections/domain_services_injector.dart';
import 'injections/repository_injector.dart';

class ApplicationInfo {
  final String platform;

  /// The app name. `CFBundleDisplayName` on iOS, `application/label` on Android.
  final String appName;

  /// The package name. `bundleIdentifier` on iOS, `getPackageName` on Android.
  final String packageName;

  /// The package version. `CFBundleShortVersionString` on iOS, `versionName` on Android.
  final String version;

  /// The build number. `CFBundleVersion` on iOS, `versionCode` on Android.
  final String buildNumber;

  ApplicationInfo({this.platform, this.appName, this.packageName, this.version, this.buildNumber});
}

class ClientCoreConfig {
  static final ClientCoreConfig _instance = ClientCoreConfig._internal();
  static const String KEY = "4VJmWcpJ9U";

  factory ClientCoreConfig() {
    return _instance;
  }

  ClientCoreConfig._internal();

  void configure({
    @required Flavor flavor,
    @required Client client,
    @required ApplicationInfo appInfo,
    @required IAppClientDataRepository appClientDataRepository,
    bool isTest = false,
  }) {
    _flavor = flavor;
    _client = client;
    _appInfo = appInfo;
    DomainServiceInjector.configure(isTest: isTest);
    RepositoryInjector.configure(appClientDataRepository: appClientDataRepository);
  }

  IBaseService getApiService(ServiceType type) {
    return domainServiceInjector?.getApiService(type);
  }

  Flavor _flavor;
  Flavor get flavor => _flavor;

  Client _client;
  Client get client => _client;

  ApplicationInfo _appInfo;
  ApplicationInfo get appInfo => _appInfo;

  RepositoryInjector _repositoryInjector = RepositoryInjector();
  RepositoryInjector get repositoryInjector => _repositoryInjector;

  DomainServiceInjector _domainServiceInjector = DomainServiceInjector();
  DomainServiceInjector get domainServiceInjector => _domainServiceInjector;

  final ILoggerManager _logger = LoggerManagerImpl();
  ILoggerManager get logger => _logger;

//  final CacheManager _cached = CacheManager();
//  CacheManager get cached => _cached;

  log(String tag, String msg) {
    logger?.log(tag, msg);
  }
}
