import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/subjects.dart';

class AppLifecycleManager {
  static final AppLifecycleManager _instance = AppLifecycleManager._internal();
  BehaviorSubject<AppLifecycleState> _appLifeCycleSubject;

  Stream<AppLifecycleState> get stream => _appLifeCycleSubject?.stream;
  AppLifecycleState get currentAppLifeCycleState => _appLifeCycleSubject?.value;

  factory AppLifecycleManager() {
    return _instance;
  }

  AppLifecycleManager._internal() {
    _appLifeCycleSubject = BehaviorSubject<AppLifecycleState>();
  }

//  var _eventEmitter = EventEmitterImpl();
  String _currentRouteName;

  start() {
    SystemChannels.lifecycle.setMessageHandler((msg) async {
      _log('AppLifecycleState: $msg');
      if (msg == AppLifecycleState.resumed.toString()) {
        _appLifeCycleSubject.add(AppLifecycleState.resumed);
//        publish(await DynamicLinks().getRedirectInfo());
      } else if (msg == AppLifecycleState.inactive.toString()) {
        _appLifeCycleSubject.add(AppLifecycleState.inactive);
      } else if (msg == AppLifecycleState.paused.toString()) {
        _appLifeCycleSubject.add(AppLifecycleState.paused);
      }
//      else if (msg == AppLifecycleState.suspending.toString()) {
//        _appLifeCycleSubject.add(AppLifecycleState.suspending);
//      }
      return null;
    });

    _subscribeDynamicLinkEvent();
  }

  @deprecated
  _subscribeDynamicLinkEvent() {
//    _eventEmitter?.unSubscribe(_onDynamicLinksEventCallback);
//    _eventEmitter?.onSubscribe<RedirectInfo>(_onDynamicLinksEventCallback);
  }

  subscribe<T>(Function callback) {
    if (callback != null) {
      _log("onSubscribe: ${callback.hashCode}");
//      _eventEmitter?.onSubscribe<T>(callback);
    }
  }

  unSubscribe(Function callback) {
    if (callback != null) {
      _log("unSubscribe: ${callback.hashCode}");
//      _eventEmitter?.unSubscribe(callback);
    }
  }

  publish(event) {
//    _eventEmitter?.publish(event);
  }

  onDidPush(String routeName) {
    _log('onDidPush: $routeName');
    _currentRouteName = routeName;
  }

  onDidPop(String routeName) {
    _log('onDidPop: $routeName');
    _currentRouteName = routeName;
  }

  void _log(String msg) {
    print("AppLifecycleManager $msg");
  }
}
