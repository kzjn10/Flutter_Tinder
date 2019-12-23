import 'package:json_annotation/json_annotation.dart';
import 'package:tinder/core/data/http/location/location_response_entity.dart';
import 'package:tinder/core/data/http/name/name_response_entity.dart';

part 'user_response_entity.g.dart';

@JsonSerializable(includeIfNull: false)
class UserResponseEntity extends Object {
  String gender;
  NameResponseEntity name;
  LocationResponseEntity location;
  String email;
  String username;
  String password;
  String salt;
  @JsonKey(includeIfNull: false)
  String md5;
  String sha1;
  String sha256;
  String registered;
  String dob;
  String phone;
  String cell;
  String sSN;
  String picture;

  UserResponseEntity(
      {this.gender,
      this.name,
      this.location,
      this.email,
      this.username,
      this.password,
      this.salt,
      this.md5,
      this.sha1,
      this.sha256,
      this.registered,
      this.dob,
      this.phone,
      this.cell,
      this.sSN,
      this.picture});

  factory UserResponseEntity.fromJson(json) => _$UserResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseEntityToJson(this);
}
