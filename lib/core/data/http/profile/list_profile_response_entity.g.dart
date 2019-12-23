// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_profile_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListProfileResponseEntity _$ListProfileResponseEntityFromJson(
    Map<String, dynamic> json) {
  return ListProfileResponseEntity(
    (json['list'] as List)
        ?.map((e) => e == null ? null : ProfileResponseEntity.fromJson(e))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListProfileResponseEntityToJson(
    ListProfileResponseEntity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('list', instance.list);
  return val;
}
