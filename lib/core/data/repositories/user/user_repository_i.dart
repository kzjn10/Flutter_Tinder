import 'package:tinder/core/data/http/profile/list_profile_response_entity.dart';

import '../base_repository_i.dart';

abstract class IUserRepository extends IBaseRepository {
  Future<ListProfileResponseEntity> fetchRandomProfile();
}
