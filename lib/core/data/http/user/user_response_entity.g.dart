// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponseEntity _$UserResponseEntityFromJson(Map<String, dynamic> json) {
  return UserResponseEntity(
    gender: json['gender'] as String,
    name:
        json['name'] == null ? null : NameResponseEntity.fromJson(json['name']),
    location: json['location'] == null
        ? null
        : LocationResponseEntity.fromJson(json['location']),
    email: json['email'] as String,
    username: json['username'] as String,
    password: json['password'] as String,
    salt: json['salt'] as String,
    md5: json['md5'] as String,
    sha1: json['sha1'] as String,
    sha256: json['sha256'] as String,
    registered: json['registered'] as String,
    dob: json['dob'] as String,
    phone: json['phone'] as String,
    cell: json['cell'] as String,
    sSN: json['sSN'] as String,
    picture: json['picture'] as String,
  );
}

Map<String, dynamic> _$UserResponseEntityToJson(UserResponseEntity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('gender', instance.gender);
  writeNotNull('name', instance.name);
  writeNotNull('location', instance.location);
  writeNotNull('email', instance.email);
  writeNotNull('username', instance.username);
  writeNotNull('password', instance.password);
  writeNotNull('salt', instance.salt);
  writeNotNull('md5', instance.md5);
  writeNotNull('sha1', instance.sha1);
  writeNotNull('sha256', instance.sha256);
  writeNotNull('registered', instance.registered);
  writeNotNull('dob', instance.dob);
  writeNotNull('phone', instance.phone);
  writeNotNull('cell', instance.cell);
  writeNotNull('sSN', instance.sSN);
  writeNotNull('picture', instance.picture);
  return val;
}
