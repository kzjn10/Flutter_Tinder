import 'package:json_annotation/json_annotation.dart';

part 'name_response_entity.g.dart';

@JsonSerializable(includeIfNull: false)
class NameResponseEntity extends Object {
  @JsonKey(includeIfNull: false)
  String title;
  String first;
  String last;

  NameResponseEntity({this.title, this.first, this.last});

  factory NameResponseEntity.fromJson(json) => _$NameResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$NameResponseEntityToJson(this);
}
