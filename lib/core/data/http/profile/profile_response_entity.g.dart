// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileResponseEntity _$ProfileResponseEntityFromJson(
    Map<String, dynamic> json) {
  return ProfileResponseEntity(
    json['user'] == null ? null : UserResponseEntity.fromJson(json['user']),
    json['seed'] as String,
    json['version'] as String,
  );
}

Map<String, dynamic> _$ProfileResponseEntityToJson(
    ProfileResponseEntity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('user', instance.user);
  writeNotNull('seed', instance.seed);
  writeNotNull('version', instance.version);
  return val;
}
