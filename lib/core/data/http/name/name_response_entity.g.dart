// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'name_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NameResponseEntity _$NameResponseEntityFromJson(Map<String, dynamic> json) {
  return NameResponseEntity(
    title: json['title'] as String,
    first: json['first'] as String,
    last: json['last'] as String,
  );
}

Map<String, dynamic> _$NameResponseEntityToJson(NameResponseEntity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('title', instance.title);
  writeNotNull('first', instance.first);
  writeNotNull('last', instance.last);
  return val;
}
