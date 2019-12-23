import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:localstorage/localstorage.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tinder/core/contants/global.dart';
import 'package:tinder/core/domain/services/user/user_service_i.dart';
import 'package:tinder/core/injections/domain_services_injector.dart';
import 'package:tinder/core/services/base/base_api_service.dart';
import 'package:tinder/core/services/logger/logger_manager.dart';
import 'package:tinder/core/services/logger/logger_manager_impl.dart';

import 'base_bloc_event.dart';
import 'base_bloc_state.dart';

abstract class BaseBloc<E extends BaseBlocEvent, S extends BaseBlocState> extends Bloc<E, S> {
  ILoggerManager get logger => LoggerManagerImpl.self;
  IUserService get userService => getApiService(ServiceType.USER_SERVICE);

  LocalStorage storage = LocalStorage('tinder_app_db');

  LocalStorage get myStorage => storage;

  BaseBloc();

  @override
  S get initialState => null;

  @override
  Stream<S> transformEvents(Stream<E> events, Stream<S> next(E event)) {
    return (events as Observable<E>).flatMap((e) {
      return Observable.timer(e, Duration(milliseconds: 1));
    }).asyncExpand(next);
  }

  @override
  Stream<S> mapEventToState(E event) async* {
    try {
      if (event is BaseFetchEvent) {
        if (isAllowFetchData(state, event)) {
          yield* onFetchDataState(state, event);
        }
      } else if (event is BaseRefreshEvent) {
        yield* onRefreshState(state, event);
      } else if (event is BaseDefaultEvent) {
        yield* onDefaultState(state, event);
      } else if (event is BaseLoadingEvent) {
        yield* onLoadingState(state, event);
      }
    } catch (e) {
      onErrorHandler(e);
      yield* onErrorState(state, event, e);
    }
  }

  bool isAllowFetchData(S state, E event) => true;

  Stream<S> onFetchDataState(S state, E event) async* {}

  Stream<S> onRefreshState(S state, E event) async* {}

  Stream<S> onDefaultState(S state, E event) async* {}

  Stream<S> onLoadingState(S state, E event) async* {}

  Stream<S> onErrorState(S state, E event, dynamic error) async* {}

  IBaseService getApiService(ServiceType serviceType) {
    return DomainServiceInjector.self.getApiService(serviceType);
  }

  onErrorHandler(Object e) {
    logError("onError", e?.toString());
  }

  log(String tag, String msg) {
    logger?.log("mapEventToState: $tag", msg);
  }

  logError(String tag, String msg) {
    logger?.logError("mapEventToState: $tag", msg);
  }

  updateToDefaultState() {}

  fetchData({bool refresh = false}) {}

  reRenderUI() {}
}
