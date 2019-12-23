//import 'dart:async';
//
//import 'package:its_mcache/its_mcache.dart';
//
//class CacheManager extends Cache<String, dynamic> {
//  static final CacheManager _instance = CacheManager._internal();
//
//  Cache _cache = LruCache<String, dynamic>(storage: SimpleStorage(size: 50));
//
//  factory CacheManager() {
//    return _instance;
//  }
//
//  CacheManager._internal() {
//    _cache.expiration = Duration(seconds: 60);
//  }
//
//  @override
//  Future<dynamic> get(String key) async {
//    return await _cache.get(key);
//  }
//
//  @override
//  set(String key, dynamic element) {
//    return _cache.set(key, element);
//  }
//
//  @override
//  bool containsKey(String key) {
//    return _cache.containsKey(key);
//  }
//
//  @override
//  clear() {
//    return _cache.clear();
//  }
//}
