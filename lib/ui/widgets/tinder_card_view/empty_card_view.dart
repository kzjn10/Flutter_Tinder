import 'package:flutter/material.dart';
import 'package:tinder/generated/i18n.dart';
import 'package:tinder/style/custom_icons.dart';

class EmptyCardView extends StatelessWidget {
  final Function callback;

  EmptyCardView({Key key, this.callback})
      : assert(callback != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    ThemeData _theme = Theme.of(context);

    return InkWell(
      onTap: callback,
      child: Container(
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
              Icon(
                CustomIcons.retry,
                size: 42,
                color: _theme.primaryColor,
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              Text(
                S.of(context).card_lbl_error.toUpperCase(),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
