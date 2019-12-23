import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(createFactory: false, createToJson: false)
class BaseRequestEntity {
  Map<String, dynamic> toJson() => Map();

  String toJsonString() {
    final map = this.toJson();
    return map?.isNotEmpty == true ? json.encode(map) : "";
  }
}
