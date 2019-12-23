import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tinder/core/bloc/app/app_bloc.dart';
import 'package:tinder/ui/styles/theme_app.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> with WidgetsBindingObserver {
  BaseState();

  AppBloc appBloc(BuildContext context) => BlocProvider.of<AppBloc>(context);

  Widget buildContent(BuildContext context) {
    return Center();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(data: AppTheme().build(context, brightness: Theme.of(context).brightness), child: buildContent(context));
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }
}
