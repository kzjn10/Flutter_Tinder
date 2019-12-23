import 'package:json_annotation/json_annotation.dart';
import 'package:tinder/core/data/http/profile/profile_response_entity.dart';

part 'list_profile_response_entity.g.dart';

@JsonSerializable(includeIfNull: false)
class ListProfileResponseEntity extends Object {
  List<ProfileResponseEntity> list;

  ListProfileResponseEntity(this.list);

//  factory ListProfileResponseEntity.fromJson(json) => _$ListProfileResponseEntityFromJson(json);
  factory ListProfileResponseEntity.fromJson(json) {
    return ListProfileResponseEntity(
      (json as List)?.map((e) => e == null ? null : ProfileResponseEntity.fromJson(e))?.toList(),
    );
  }

  Map<String, dynamic> toJson() => _$ListProfileResponseEntityToJson(this);
}
