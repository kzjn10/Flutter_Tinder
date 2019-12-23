import 'package:tinder/core/entites/profile_entity.dart';

import '../base_bloc_state.dart';

class HomeScreenState extends BaseBlocState {
  final ProfileEntity profileEntity;
  final List<ProfileEntity> cachedList;
  final bool haveError;

  HomeScreenState({
    this.profileEntity,
    this.cachedList,
    this.haveError,
    bool isLoading,
    int timeStamp,
  }) : super(isLoading: isLoading, timeStamp: timeStamp);

  HomeScreenState copyWith({
    ProfileEntity profileEntity,
    List<ProfileEntity> cachedList,
    bool haveError = false,
    bool isLoading,
  }) {
    return HomeScreenState(
      profileEntity: profileEntity ?? this.profileEntity,
      cachedList: cachedList ?? this.cachedList,
      haveError: haveError ?? this.haveError,
      isLoading: isLoading ?? this.isLoading,
      timeStamp: DateTime.now().millisecondsSinceEpoch,
    );
  }
}
