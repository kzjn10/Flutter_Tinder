import 'package:tinder/core/entites/profile_entity.dart';
import 'package:tinder/core/services/base/base_api_service.dart';

abstract class IUserService extends IBaseService {
  Future<List<ProfileEntity>> getRandomProfile();
}
