import 'dart:async';

import 'package:tinder/core/entites/profile_entity.dart';

import '../base_bloc.dart';
import '../base_bloc_event.dart';
import 'home_events.dart';
import 'home_state.dart';

class HomeScreenBloc extends BaseBloc<BaseBlocEvent, HomeScreenState> {
  @override
  HomeScreenState get initialState => HomeScreenState(isLoading: false);

  @override
  Stream<HomeScreenState> mapEventToState(BaseBlocEvent event) async* {
    if (event is FetchRandomProfileEvent) {
      yield* _fetchRandomProfileState(event);
    } else if (event is InitFavoriteListEvent) {
      yield state.copyWith(cachedList: event.list, isLoading: false);
    }
  }

  Stream<HomeScreenState> _fetchRandomProfileState(FetchRandomProfileEvent event) async* {
    try {
      yield state.copyWith(isLoading: true);

      final _listProfile = await userService.getRandomProfile();
      if (_listProfile == null) {
        yield state.copyWith(isLoading: false);
      } else {
        ProfileEntity _profileData;
        if (_listProfile.length != 0) {
          _profileData = _listProfile[0] ?? null;
        }

        if (_profileData != null) {
          yield state.copyWith(profileEntity: _profileData, isLoading: false);
        } else {
          yield state.copyWith(isLoading: false);
        }
      }
    } catch (e) {
      yield state.copyWith(isLoading: false, haveError: true);
    }
  }

  @override
  fetchData({bool refresh = false}) {
    add(FetchRandomProfileEvent());
  }

  initFavoriteListState(List<ProfileEntity> favoriteList) {
    add(InitFavoriteListEvent(list: favoriteList));
  }
}
