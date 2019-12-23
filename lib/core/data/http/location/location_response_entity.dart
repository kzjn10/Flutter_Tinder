import 'package:json_annotation/json_annotation.dart';

part 'location_response_entity.g.dart';

@JsonSerializable(includeIfNull: false)
class LocationResponseEntity extends Object {
  String street;
  String city;
  String state;
  @JsonKey(includeIfNull: false)
  String zip;

  LocationResponseEntity({this.street, this.city, this.state, this.zip});

  factory LocationResponseEntity.fromJson(json) => _$LocationResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$LocationResponseEntityToJson(this);
}
