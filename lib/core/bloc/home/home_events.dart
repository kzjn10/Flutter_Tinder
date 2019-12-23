import 'package:flutter/cupertino.dart';
import 'package:tinder/core/entites/profile_entity.dart';

import '../base_bloc_event.dart';

class FetchRandomProfileEvent extends BaseBlocEvent {}

class InitFavoriteListEvent extends BaseBlocEvent {
  final List<ProfileEntity> list;

  InitFavoriteListEvent({@required this.list});
}
