import 'package:tinder/core/data/base/base_result_entity.dart';
import 'package:tinder/core/data/http/profile/list_profile_response_entity.dart';
import 'package:tinder/core/data/repositories/user/user_repository_i.dart';

import '../base_repository.dart';

class UserRepositoryImpl extends BaseRepository implements IUserRepository {
  @override
  Future<ListProfileResponseEntity> fetchRandomProfile() async {
    BaseResultEntity _res = await get('$baseUrl');
    return _res?.data != null ? ListProfileResponseEntity.fromJson(_res.data) : null;
  }
}
