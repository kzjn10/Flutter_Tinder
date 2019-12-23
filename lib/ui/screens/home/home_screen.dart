import 'package:flutter/material.dart';
import 'package:tinder/core/bloc/home/home_bloc.dart';
import 'package:tinder/core/bloc/home/home_state.dart';
import 'package:tinder/core/entites/profile_entity.dart';
import 'package:tinder/generated/i18n.dart';
import 'package:tinder/style/colors.dart';
import 'package:tinder/style/custom_icons.dart';
import 'package:tinder/ui/base/base_layout.dart';
import 'package:tinder/ui/utils/curve_background.dart';
import 'package:tinder/ui/utils/snack_bar_utils.dart';
import 'package:tinder/ui/widgets/widgets.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends BaseLayoutState<MyHomePage, HomeScreenBloc, HomeScreenState> {
  _MyHomePageState() {
    bloc = HomeScreenBloc();
    bloc.fetchData();
  }

  final queryKey = "favorite";
  HomeScreenState get _state => bloc?.state;

  ProfileEntity get _profile => _state.profileEntity ?? null;

  bool get _isLoading => _state.isLoading ?? false;
  bool get _haveError => _state.haveError ?? false;

  List<ProfileEntity> _cacheList = [];

  Size _size;
  ThemeData _themeData;

  @override
  Widget buildContent(BuildContext context) {
    _themeData = Theme.of(context);
    _size = MediaQuery.of(context).size;

    return Stack(
      children: <Widget>[
        /// Background
        Container(
          width: double.infinity,
          height: double.infinity,
          color: kColorPurpleBg,
        ),
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ClipPath(
                clipper: CurveBackground(),
                child: Container(
                  width: double.infinity,
                  height: _size.height * .5,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [_themeData.primaryColorDark, _themeData.primaryColor],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),

        /// Card
        Container(
          child: Center(child: _buildContentCard()),
        ),

        /// Favorite list
        Container(
          child: Column(
            children: <Widget>[
              Expanded(child: Container()),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                width: _size.width * .55,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(100.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: _themeData.primaryColor.withOpacity(.15),
                      blurRadius: 20.0,
                      spreadRadius: 10.0,
                      offset: Offset(
                        10.0,
                        10.0,
                      ),
                    )
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(
                              CustomIcons.heart,
                              size: 20,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                            ),
                            Text(S.of(context).card_lbl_favoriteList)
                          ],
                        )),
                    onTap: () {
                      _showFavoriteDialog(context);
                    },
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget buildLoadingIndicator(BuildContext context) {
    _themeData = Theme.of(context);
    _size = MediaQuery.of(context).size;

    return Stack(
      children: <Widget>[
        /// Background
        Container(
          width: double.infinity,
          height: double.infinity,
          color: kColorPurpleBg,
        ),
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ClipPath(
                clipper: CurveBackground(),
                child: Container(
                  width: double.infinity,
                  height: _size.height * .5,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [_themeData.primaryColorDark, _themeData.primaryColor],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        /// Card
        Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Center(child: TinderCardShimmer()),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// This func adapt for mobile screen, so need improve for tablet or lager device
  /// Modify [onDragEnd] func to make it better
  Widget _buildCardList() {
    var _item = TinderCard(profile: _profile);
    List<Widget> _cardList = [];
    _cardList.add(TinderCardDefault());
    _cardList.add(Container(
      margin: EdgeInsets.fromLTRB(20.0, 0, 0, 20.0),
      child: Draggable(
        onDraggableCanceled: (_, offset) {
          debugPrint("${offset.dx}");
        },
        onDragEnd: (drag) {
          if (drag.offset.dx < -(_size.width / 4)) {
            /// Load next batch
            bloc?.fetchData();
          } else if (drag.offset.dx > _size.width * .75) {
            /// Store to favorite list
            _addFavorite();
          }
        },
        onDragCompleted: () {
          debugPrint("On drag complete");
        },
        onDragStarted: () {
          debugPrint("On drag started");
        },
        childWhenDragging: Container(),
        feedback: _item,
        child: _item,
      ),
    ));

    return Stack(
      alignment: Alignment.center,
      children: _cardList,
    );
  }

  /// Need refactor code
  Future<void> _showFavoriteDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).card_lbl_favoriteList),
          content: FutureBuilder(
            future: bloc.myStorage.ready,
            builder: (BuildContext context, snapshot) {
              if (snapshot.data == true) {
                var data = bloc.myStorage.getItem(queryKey);
                if (data == null) {
                  return Container(
                    height: _size.height * .3,
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Icon(
                            CustomIcons.info,
                            size: 42,
                            color: _themeData.primaryColor,
                          ),
                          Padding(padding: EdgeInsets.only(top: 20)),
                          Text(S.of(context).card_lbl_noFavoriteItem),
                        ],
                        mainAxisSize: MainAxisSize.min,
                      ),
                    ),
                  );
                }

                _cacheList = List<ProfileEntity>.from((data as List).map((item) => ProfileEntity.fromJson(item)));

                return Container(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _cacheList.length,
                    itemBuilder: (context, index) {
                      return _buildFavoriteItem(_cacheList[index]);
                    },
                  ),
                );
              } else {
                return Container(
                  height: _size.height * .3,
                  child: Center(
                    child: CircularProgressIndicator(strokeWidth: 2.0),
                  ),
                );
              }
            },
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                (S.of(context).card_lbl_btnClose.toUpperCase()),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  /// Add favorite profile
  _addFavorite() {
    var _temp = _cacheList?.firstWhere((item) => item.seed == state?.profileEntity?.seed, orElse: () => null);
    if (_temp == null) {
      _cacheList.add(_profile);
      var _cacheData = _cacheList.map((item) => item.toJson()).toList();
      bloc.myStorage.setItem(queryKey, _cacheData);
      scaffoldKey.currentState.showSnackBar(
        SnackBarUtils.buildSnackBar(context, S.of(context).card_lbl_addFavoriteSuccess),
      );
    } else {
      scaffoldKey.currentState.showSnackBar(
        SnackBarUtils.buildErrorSnackBar(context, S.of(context).card_lbl_existItemMsg),
      );
    }
  }

  /// Build favorite item view
  _buildFavoriteItem(ProfileEntity data) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              data?.userData?.picture ?? "",
              width: 35,
              height: 35,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
          ),
          Text("${data?.userData?.name?.title ?? ""} ${data?.userData?.name?.last ?? ""} ${data?.userData?.name?.first ?? ""}"),
        ],
      ),
    );
  }

  Widget _buildContentCard() {
    if (_isLoading) {
      return TinderCardShimmer();
    } else if (_haveError) {
      return EmptyCardView(
        callback: () {
          bloc?.fetchData();
        },
      );
    } else if (_profile != null) {
      return _buildCardList();
    } else {
      return TinderCardShimmer();
    }
  }
}
