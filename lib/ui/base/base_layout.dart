import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tinder/core/bloc/base_bloc.dart';
import 'package:tinder/core/bloc/base_bloc_state.dart';
import 'package:tinder/ui/styles/theme_app.dart';
import 'package:tinder/ui/utils/snack_bar_utils.dart';
import 'package:tinder/ui/widgets/empty/empty_view.dart';
import 'package:tinder/ui/widgets/error_view/error_view.dart';

import 'base_state.dart';

abstract class BaseLayoutState<T extends StatefulWidget, B extends BaseBloc, S extends BaseBlocState> extends BaseState<T> {
  BaseLayoutState();

  B bloc;
  S state;

  var refreshKey = GlobalKey<RefreshIndicatorState>();
  bool isShowLoadingIndicator = false;

  String getTitle(BuildContext context) => "";

  String getEmptyContentMsg(BuildContext context) => "";

  bool get isSupportRefresh => false;

  bool get resizeToAvoidBottomPadding => true;
  bool willDisposeBloc = true;

  bool get contentOnly => false;

  var scaffoldKey = GlobalKey<ScaffoldState>();

  S get currentBlocState => bloc?.state;

  List<Widget> buildHeaderActions() => null;

  Widget buildDrawer(BuildContext context) => null;

  Widget buildContent(BuildContext context) => Container();

  Widget buildEmptyView(BuildContext context) => Center(child: EmptyView(message: getEmptyContentMsg(context)));

  Widget buildErrorView(BuildContext context) => ErrorView("Error", onErrorViewInteraction: () => print('Interacting with Error view'));

  Widget buildLoadingIndicator(BuildContext context) {
    return Center(child: CircularProgressIndicator(strokeWidth: 2.0));
  }

  ThemeData buildTheme(BuildContext context) {
    return AppTheme().build(context, brightness: Theme.of(context).brightness);
  }

  AppBar buildAppBar(BuildContext context, String title) {
    return AppBar(actions: buildHeaderActions(), title: buildTitle(context, title), brightness: Brightness.light);
  }

  Widget buildTitle(BuildContext context, String title) {
    return Text(title ?? "", style: Theme.of(context).primaryTextTheme.subtitle);
  }

  @override
  Widget build(BuildContext context) {
    return bloc != null
        ? BlocBuilder(bloc: bloc, builder: buildWidgetBloc)
        : _buildPageWidget(
            context,
            body: buildBody(context),
          );
  }

  Widget _buildPageWidget(BuildContext context, {Widget body}) {
    return contentOnly
        ? body
        : Theme(
            data: buildTheme(context),
            child: Scaffold(
              key: scaffoldKey,
//              appBar: buildAppBar(context, getTitle(context)),
              body: body,
              resizeToAvoidBottomPadding: resizeToAvoidBottomPadding,
              drawer: buildDrawer(context),
              primary: true,
            ),
          );
  }

  Widget buildBody(BuildContext context) {
    return buildContent(context);
  }

  bool isAllowOnBeforeBuildWidget(BaseBlocState _state) => (state != _state);

  Widget buildWidgetBloc(BuildContext context, BaseBlocState _state) {
    if (isAllowOnBeforeBuildWidget(_state)) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
//        onBeforeBuildWidget(context, _state);
      });
    }
    if (_state is ErrorState) {
      return _buildPageWidget(context, body: buildErrorView(context));
    }

    if ((_state is LoadingState) || (_state.isLoading)) {
      return _buildPageWidget(context, body: buildLoadingIndicator(context));
    }

//    if (_state?.isEmpty == true && isInternetConnected == false) {
    if (_state?.isEmpty == true) {
      return _buildPageWidget(context, body: buildNetworkNoContent());
    }

    if (_state is EmptyState) {
      return _buildPageWidget(context, body: buildEmptyView(context));
    }

    if (_state is S) {
      state = _state;
    }
    return _buildPageWidget(context, body: buildBody(context));
  }

  showSnackBar(SnackBar snackBar) {
    scaffoldKey?.currentState?.showSnackBar(snackBar);
  }

  showSnackBarWithText(String content, {Duration duration = const Duration(seconds: 5)}) {
    scaffoldKey?.currentState?.showSnackBar(SnackBarUtils.buildSnackBar(context, content, duration: duration));
  }

  void hideSnackBar() {
    SnackBarUtils.hideSnackBar(scaffoldKey);
  }

  @override
  void dispose() {
    if (willDisposeBloc == true) {
      bloc?.close();
    }
    super.dispose();
  }

  void disposeBloc() {
    bloc?.close();
  }

  Widget buildNetworkNoContent() {
    return Container(
      height: MediaQuery.of(context).size.height * .6,
      child: FlatButton(
        onPressed: () => bloc?.fetchData(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: 100,
//              child: Image(image: AssetImage(Assets.ph_asset_emptySearchResult), fit: BoxFit.fitWidth),
              child: Icon(Icons.hourglass_empty),
            ),
            Align(
              heightFactor: 1.5,
              alignment: Alignment.center,
              child: Text(
                'No Content'.toUpperCase(),
                style: Theme.of(context).textTheme.title.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                "Please check your network connection!",
                style: Theme.of(context).textTheme.body1.copyWith(color: Theme.of(context).hintColor),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
