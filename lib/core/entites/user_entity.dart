import 'package:tinder/core/data/http/location/location_response_entity.dart';
import 'package:tinder/core/data/http/name/name_response_entity.dart';
import 'package:tinder/core/data/http/user/user_response_entity.dart';

class UserEntity {
  String gender;
  NameEntity name;
  LocationEntity location;
  String email;
  String username;
  String password;
  String salt;
  String md5;
  String sha1;
  String sha256;
  String registered;
  String dob;
  String phone;
  String cell;
  String sSN;
  String picture;

  UserEntity(
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

  UserEntity.fromResponseEntity(UserResponseEntity responseEntity) {
    gender = responseEntity.gender;
    name = NameEntity.fromResponse(responseEntity.name);
    location = LocationEntity.fromResponse(responseEntity.location);
    email = responseEntity.email;
    username = responseEntity.email;
    password = responseEntity.password;
    salt = responseEntity.salt;
    md5 = responseEntity.md5;
    sha1 = responseEntity.sha1;
    sha256 = responseEntity.sha256;
    registered = responseEntity.registered;
    dob = responseEntity.dob;
    phone = responseEntity.phone;
    cell = responseEntity.cell;
    sSN = responseEntity.sSN;
    picture = responseEntity.picture;
  }

  UserEntity.fromJson(Map<String, dynamic> json) {
    gender = json['gender'];
    name = json['name'] != null ? NameEntity.fromJson(json['name']) : null;
    location = json['location'] != null ? LocationEntity.fromJson(json['location']) : null;
    email = json['email'];
    username = json['username'];
    password = json['password'];
    salt = json['salt'];
    md5 = json['md5'];
    sha1 = json['sha1'];
    sha256 = json['sha256'];
    registered = json['registered'];
    dob = json['dob'];
    phone = json['phone'];
    cell = json['cell'];
    sSN = json['SSN'];
    picture = json['picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['gender'] = this.gender;
    if (this.name != null) {
      data['name'] = this.name.toJson();
    }
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    data['email'] = this.email;
    data['username'] = this.username;
    data['password'] = this.password;
    data['salt'] = this.salt;
    data['md5'] = this.md5;
    data['sha1'] = this.sha1;
    data['sha256'] = this.sha256;
    data['registered'] = this.registered;
    data['dob'] = this.dob;
    data['phone'] = this.phone;
    data['cell'] = this.cell;
    data['SSN'] = this.sSN;
    data['picture'] = this.picture;
    return data;
  }
}

class NameEntity {
  String title;
  String first;
  String last;

  NameEntity({this.title, this.first, this.last});

  NameEntity.fromResponse(NameResponseEntity item) {
    title = item.title;
    first = item.first;
    last = item.last;
  }

  NameEntity.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    first = json['first'];
    last = json['last'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = this.title;
    data['first'] = this.first;
    data['last'] = this.last;
    return data;
  }
}

class LocationEntity {
  String street;
  String city;
  String state;
  String zip;

  LocationEntity({this.street, this.city, this.state, this.zip});

  LocationEntity.fromResponse(LocationResponseEntity item) {
    street = item.street;
    city = item.city;
    state = item.state;
    zip = item.zip;
  }

  LocationEntity.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    city = json['city'];
    state = json['state'];
    zip = json['zip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['street'] = this.street;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zip'] = this.zip;
    return data;
  }
}
