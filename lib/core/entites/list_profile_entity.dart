import 'package:tinder/core/data/http/profile/list_profile_response_entity.dart';
import 'package:tinder/core/data/http/profile/profile_response_entity.dart';
import 'package:tinder/core/entites/profile_entity.dart';

class ListProfileEntity {
  List<ProfileEntity> listProfile;

  ListProfileEntity({
    this.listProfile,
  });

  ListProfileEntity.fromResponseEntity(ListProfileResponseEntity entity) {
    listProfile = entity.list?.map((item) => ProfileEntity.fromResponseEntity(ProfileResponseEntity.fromJson(item)))?.toList();
  }
}
