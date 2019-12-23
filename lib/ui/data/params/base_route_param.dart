import 'package:equatable/equatable.dart';

abstract class BaseRouteParams extends Equatable {
  final bool showFullScreen;

  BaseRouteParams(this.showFullScreen, {List props, String themeName});

  @override
  List<Object> get props => [showFullScreen, ...(props ?? [])];
}
