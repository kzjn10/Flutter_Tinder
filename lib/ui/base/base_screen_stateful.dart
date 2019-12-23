import 'package:flutter/material.dart';
import 'package:tinder/ui/data/params/base_route_param.dart';

abstract class BaseScreenStateful<Params extends BaseRouteParams> extends StatefulWidget {
  final Params params;

  BaseScreenStateful({@required this.params, Key key}) : super(key: key);
}
