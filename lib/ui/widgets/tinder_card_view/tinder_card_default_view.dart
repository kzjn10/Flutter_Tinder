import 'package:flutter/material.dart';
import 'package:tinder/generated/i18n.dart';
import 'package:tinder/style/custom_icons.dart';

class TinderCardDefault extends StatelessWidget {
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
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(child: Container()),
            Icon(
              CustomIcons.changeEmoji,
              size: 42,
              color: _theme.primaryColor,
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Text(
              S.of(context).card_lbl_dismissToLoadNextBatch.toUpperCase(),
              style: _theme.textTheme.subtitle.copyWith(color: _theme.primaryColor),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Text(S.of(context).card_lbl_dismissToLoadNextBatchDescription),
            Expanded(child: Container()),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Row(
                children: <Widget>[
                  Icon(
                    CustomIcons.leftArrow,
                    size: 24,
                    color: _theme.textTheme.body1.color.withOpacity(.5),
                  ),
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Text(
                    S.of(context).card_lbl_next,
                    style: _theme.textTheme.body1.copyWith(fontSize: 12, color: _theme.textTheme.body1.color.withOpacity(.5)),
                  ),
                  Expanded(child: Container()),
                  Text(
                    S.of(context).card_lbl_addFavorite,
                    style: _theme.textTheme.body1.copyWith(fontSize: 12, color: _theme.textTheme.body1.color.withOpacity(.5)),
                  ),
                  Padding(padding: EdgeInsets.only(right: 10)),
                  Icon(
                    CustomIcons.rightArrow,
                    size: 24,
                    color: _theme.textTheme.body1.color.withOpacity(.5),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
