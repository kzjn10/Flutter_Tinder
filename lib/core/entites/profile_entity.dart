import 'package:tinder/core/data/http/profile/profile_response_entity.dart';

import 'user_entity.dart';

class ProfileEntity {
  UserEntity userData;
  String seed;
  String version;

  ProfileEntity({this.userData, this.seed, this.version});

  ProfileEntity.fromResponseEntity(ProfileResponseEntity item) {
    userData = UserEntity.fromResponseEntity(item.user);
    seed = item.seed;
    version = item.version;
  }

  ProfileEntity.fromJson(Map<String, dynamic> json) {
    userData = json['user'] != null ? new UserEntity.fromJson(json['user']) : null;
    seed = json['seed'];
    version = json['version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userData != null) {
      data['user'] = this.userData.toJson();
    }
    data['seed'] = this.seed;
    data['version'] = this.version;
    return data;
  }
}
