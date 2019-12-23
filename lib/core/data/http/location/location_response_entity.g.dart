// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationResponseEntity _$LocationResponseEntityFromJson(
    Map<String, dynamic> json) {
  return LocationResponseEntity(
    street: json['street'] as String,
    city: json['city'] as String,
    state: json['state'] as String,
    zip: json['zip'] as String,
  );
}

Map<String, dynamic> _$LocationResponseEntityToJson(
    LocationResponseEntity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('street', instance.street);
  writeNotNull('city', instance.city);
  writeNotNull('state', instance.state);
  writeNotNull('zip', instance.zip);
  return val;
}
