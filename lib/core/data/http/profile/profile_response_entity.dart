import 'package:json_annotation/json_annotation.dart';
import 'package:tinder/core/data/http/user/user_response_entity.dart';

part 'profile_response_entity.g.dart';

@JsonSerializable(includeIfNull: false)
class ProfileResponseEntity extends Object {
  UserResponseEntity user;

  @JsonKey(name: 'seed')
  String seed;
  String version;

  ProfileResponseEntity(this.user, this.seed, this.version);

  factory ProfileResponseEntity.fromJson(json) => _$ProfileResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseEntityToJson(this);
}
