import '../base_repository_i.dart';

abstract class IAppClientDataRepository implements IBaseRepository {
  Future<dynamic> setStringCache(String key, String value);

  Future<dynamic> setIntCache(String key, int value);

  Future<dynamic> setBoolCache(String key, bool value);

  Future<dynamic> setDoubleCache(String key, double value);

  Future<dynamic> setStringListCache(String key, List<String> value);

  Future<dynamic> getCache(String key);

  Future<dynamic> clear();

  Future<bool> remove(String key);

  Future<bool> setListCache(String key, List<Map<String, dynamic>> list);

  Future<bool> setMapCache(String key, Map<String, dynamic> map);

  Future<List<Map<String, dynamic>>> getListCache(String key);

  Future<Map<String, dynamic>> getMapCache(String key);
}
