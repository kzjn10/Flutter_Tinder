import 'package:tinder/core/data/repositories/appClientData/app_data_repository_i.dart';
import 'package:tinder/core/data/repositories/user/user_repository_i.dart';
import 'package:tinder/core/injections/repository_injector.dart';

import '../../client_core_config.dart';

abstract class BaseServiceImpl {
  BaseServiceImpl();

  RepositoryInjector get _injector => ClientCoreConfig().repositoryInjector;

  IAppClientDataRepository get appDataRepository => _injector.appClientDataRepository;

  IUserRepository get userRepository => _injector.userRepository;

  log(String tag, String msg) {
    print('${tag?.toUpperCase()}: $msg');
  }

  handleErrorExceptions(e) {
    log("BaseService", e.toString());
  }

  getTag(String className, String functionName) {
    return 'class $className method: $functionName';
  }
}
