import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tinder/core/data/repositories/appClientData/app_data_repository_i.dart';

///
/// This wrapper class using for simple cache data
///
class AppClientDataRepository implements IAppClientDataRepository {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static _parseJson(String json) {
    return JsonDecoder().convert(json);
  }

  static String _encodeJson(Map<String, dynamic> map) {
    return JsonEncoder().convert(map);
  }

  static List<Map<String, dynamic>> _parseJsonList(List<String> json) {
    JsonDecoder _decoder = JsonDecoder();
    final _parsedList = List<Map<String, dynamic>>();
    for (var value in json) {
      _parsedList.add(_decoder.convert(value));
    }
    return _parsedList;
  }

  static List<String> _encodeJsonList(List<Map<String, dynamic>> list) {
    final _listJson = List<String>();
    final _encoder = JsonEncoder();
    for (var value in list) {
      _listJson.add(_encoder.convert(value));
    }
    return _listJson;
  }

  Future<dynamic> setStringCache(String key, String value) async {
    final SharedPreferences prefs = await _prefs;
    return await prefs.setString(key, value);
  }

  Future<dynamic> setIntCache(String key, int value) async {
    final SharedPreferences prefs = await _prefs;
    return await prefs.setInt(key, value);
  }

  Future<dynamic> setBoolCache(String key, bool value) async {
    final SharedPreferences prefs = await _prefs;
    return await prefs.setBool(key, value);
  }

  Future<dynamic> setDoubleCache(String key, double value) async {
    final SharedPreferences prefs = await _prefs;
    return await prefs.setDouble(key, value);
  }

  Future<dynamic> setStringListCache(String key, List<String> value) async {
    final SharedPreferences prefs = await _prefs;
    return await prefs.setStringList(key, value);
  }

  @override
  Future<dynamic> getCache(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.get(key);
  }

  Future<dynamic> clear() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.clear();
  }

  Future<bool> remove(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.remove(key);
  }

  Future<bool> setListCache(String key, List<Map<String, dynamic>> list) async {
    final SharedPreferences prefs = await _prefs;
    final _listJson = await compute(_encodeJsonList, list);
    return await prefs.setStringList(key, _listJson);
  }

  Future<bool> setMapCache(String key, Map<String, dynamic> map) async {
    final SharedPreferences prefs = await _prefs;
    final _json = await compute(_encodeJson, map);
    return await prefs.setString(key, _json);
  }

  Future<List<Map<String, dynamic>>> getListCache(String key) async {
    final SharedPreferences prefs = await _prefs;
    List<String> _cachedList = prefs.getStringList(key);

    if (!(_cachedList?.isNotEmpty == true)) {
      return [];
    }

    return await compute(_parseJsonList, _cachedList);
  }

  Future<Map<String, dynamic>> getMapCache(String key) async {
    final SharedPreferences prefs = await _prefs;
    final String cached = prefs.getString(key);

    if (cached == null) {
      return null;
    }

    return await compute(_parseJson, cached) as Map<String, dynamic>;
  }
}
