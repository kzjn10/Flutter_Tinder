import 'dart:collection';

import 'package:tinder/core/contants/global.dart';
import 'package:tinder/core/domain/services/user/user_service_impl.dart';
import 'package:tinder/core/services/base/base_api_service.dart';

class DomainServiceInjector {
  static final DomainServiceInjector _singleton = DomainServiceInjector._internal();

  static DomainServiceInjector get self => _singleton;

  DomainServiceInjector._internal();

  static IBaseService _userService;

  static HashMap<ServiceType, IBaseService> _serviceMap = HashMap.from({
    ServiceType.USER_SERVICE: _userService,
  });

  static void configure({IBaseService pushNotificationService, bool isTest = false}) {
    _userService = UserServiceImpl();
  }

  factory DomainServiceInjector() {
    return _singleton;
  }

  IBaseService getApiService(ServiceType type) {
    if (_serviceMap != null && _serviceMap.length != 0) {
      return _serviceMap[type];
    }

    return null;
  }
}
