class BaseResultEntity {
  final int code;
  final String message;
  final List<dynamic> data;

  BaseResultEntity({this.code, this.message, this.data});

  factory BaseResultEntity.fromJson(Map<String, dynamic> map) {
    return BaseResultEntity(
      code: (map.containsKey('code') ? map['code'] : 200),
      message: (map.containsKey('message') ? map['message'] : ""),
      data: (map.containsKey('results') ? map['results'] : null),
    );
  }
}
