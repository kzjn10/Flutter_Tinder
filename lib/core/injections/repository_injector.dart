import 'dart:collection';

import 'package:tinder/core/contants/global.dart';
import 'package:tinder/core/data/repositories/appClientData/app_data_repository_i.dart';
import 'package:tinder/core/data/repositories/repositories.dart';
import 'package:tinder/core/data/repositories/user/user_repository_i.dart';
import 'package:tinder/core/data/repositories/user/user_repository_impl.dart';
import 'package:tinder/core/domain/contants/global.dart';

import '../client_core_config.dart';

class RepositoryInjector {
  static final RepositoryInjector _instance = RepositoryInjector._internal();
  static IAppClientDataRepository _appClientDataRepository;

  static void configure({IAppClientDataRepository appClientDataRepository}) {
    _appClientDataRepository = appClientDataRepository;
    _userRepository = UserRepositoryImpl();
  }

  factory RepositoryInjector() {
    return _instance;
  }

  RepositoryInjector._internal();

  String getBaseUrl() {
    return ApiUrl.PROD;
  }

  Flavor get flavor => ClientCoreConfig().flavor;

  IAppClientDataRepository get appClientDataRepository => getRepository(RepositoryType.APP_CLIENT_REPOSITORY);
  IUserRepository get userRepository => getRepository(RepositoryType.USER_REPOSITORY);

  static IBaseRepository _userRepository;

  static HashMap<RepositoryType, IBaseRepository> _repositoryMap = HashMap.from({
    RepositoryType.USER_REPOSITORY: _userRepository,
    RepositoryType.APP_CLIENT_REPOSITORY: _appClientDataRepository,
  });

  IBaseRepository getRepository(RepositoryType type) {
    if (_repositoryMap != null && _repositoryMap.length != 0) {
      return _repositoryMap[type];
    }

    return null;
  }
}
