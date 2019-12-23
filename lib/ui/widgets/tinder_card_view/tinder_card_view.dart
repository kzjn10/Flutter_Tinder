import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tinder/core/entites/profile_entity.dart';
import 'package:tinder/generated/i18n.dart';
import 'package:tinder/style/colors.dart';
import 'package:tinder/style/style.dart';
import 'package:tinder/ui/constant/ui_constants.dart';

import '../widgets.dart';

class TinderCard extends StatefulWidget {
  final ProfileEntity profile;

  TinderCard({@required this.profile}) : assert(profile != null);

  @override
  _TinderCardState createState() => _TinderCardState();
}

class _TinderCardState extends State<TinderCard> {
  ActionType _type = ActionType.ADDRESS;
  String _title;
  String _content;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    ThemeData _theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
        boxShadow: [
          BoxShadow(
            color: _theme.primaryColor.withOpacity(.15),
            blurRadius: 20.0,
            spreadRadius: 10.0,
            offset: Offset(
              10.0,
              10.0,
            ),
          )
        ],
      ),
      width: _size.width * .75,
      height: _size.height * .65,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: _size.width * .255,
                  decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: _theme.dividerColor.withOpacity(0.5), width: 1),
                      ),
                      color: _theme.dividerColor.withOpacity(.225)),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: _size.width * .05,
                  ),
                  width: _size.width * .3,
                  height: _size.width * .3,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: _theme.dividerColor,
                      ),
                      color: kColorWhite),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      widget.profile?.userData?.picture ?? "https://institutogoldenprana.com.br/wp-content/uploads/2015/08/no-avatar-25359d55aa3c93ab3466622fd2ce712d1.jpg",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text(
                    _title ?? S.of(context).card_lbl_myAddress,
                    style: _theme.textTheme.subhead.copyWith(color: _theme.textTheme.subhead.color.withOpacity(.5)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                  ),
                  Text(
                    _content ?? widget.profile?.userData?.location?.street ?? "",
                    style: _theme.textTheme.title,
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: _size.height * .025),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CustomButton(
                  iconData: CustomIcons.user,
                  isSelected: _type == ActionType.PROFILE,
                  onPress: () {
                    _onSelectionChange(ActionType.PROFILE);
                  },
                ),
                CustomButton(
                  iconData: CustomIcons.calendar,
                  isSelected: _type == ActionType.CALENDAR,
                  onPress: () {
                    _onSelectionChange(ActionType.CALENDAR);
                  },
                ),
                CustomButton(
                  iconData: CustomIcons.map,
                  isSelected: _type == ActionType.ADDRESS,
                  onPress: () {
                    _onSelectionChange(ActionType.ADDRESS);
                  },
                ),
                CustomButton(
                  iconData: CustomIcons.phone,
                  isSelected: _type == ActionType.PHONE,
                  onPress: () {
                    _onSelectionChange(ActionType.PHONE);
                  },
                ),
                CustomButton(
                  iconData: CustomIcons.lock,
                  isSelected: _type == ActionType.LOCK,
                  onPress: () {
                    _onSelectionChange(ActionType.LOCK);
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _onSelectionChange(ActionType type) {
    _type = type;
    switch (type) {
      case ActionType.PROFILE:
        _title = S.of(context).card_lbl_myProfile;
        _content = S.of(context).card_lbl_myProfileBuilder(widget.profile?.userData?.name?.title ?? "", widget.profile?.userData?.name?.first ?? "", widget.profile?.userData?.name?.last ?? "");
        break;
      case ActionType.CALENDAR:
        _title = S.of(context).card_lbl_myBirthday;
        var _datetime = DateTime.fromMillisecondsSinceEpoch(int.parse(widget.profile?.userData?.dob ?? 0) * 1000);
        _content = "${DateFormat('dd/MM/yyyy').format(_datetime)}";
        break;
      case ActionType.ADDRESS:
        _title = S.of(context).card_lbl_myAddress;
        _content = widget.profile?.userData?.location?.street ?? "";
        break;
      case ActionType.PHONE:
        _title = S.of(context).card_lbl_myPhone;
        _content = widget.profile?.userData?.phone ?? "";
        break;
      case ActionType.LOCK:
        _title = S.of(context).card_lbl_myStatus;
        _content = widget.profile?.userData?.registered ?? "";
        break;
      default:
        break;
    }

    setState(() {});
  }
}
