import 'package:tinder/core/domain/services/user/user_service_i.dart';
import 'package:tinder/core/entites/profile_entity.dart';
import 'package:tinder/core/services/base/base_api_service_impl.dart';

class UserServiceImpl extends BaseServiceImpl implements IUserService {
  @override
  Future<List<ProfileEntity>> getRandomProfile() async {
    final _data = await userRepository.fetchRandomProfile();
    if (_data != null) {
      return _data.list.map((item) => ProfileEntity.fromResponseEntity(item)).toList();
    }

    return null;
  }
}
