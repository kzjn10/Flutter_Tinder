import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tinder/core/bloc/base_bloc.dart';
import 'package:tinder/core/bloc/base_bloc_state.dart';

import 'base_layout.dart';

abstract class BaseContentLayoutState<T extends StatefulWidget, B extends BaseBloc, BS extends BaseBlocState> extends BaseLayoutState<T, B, BS> {
  @override
  bool get contentOnly => true;
}
