import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tinder/style/colors.dart';
import 'package:tinder/ui/styles/theme_snackbar.dart';

class SnackBarUtils {
  static Widget buildSnackBar(BuildContext context, String content, {Duration duration = const Duration(seconds: 5)}) {
    ThemeData theme = SnackBarTheme().build(context);

    return SnackBar(
      backgroundColor: Colors.transparent,
      duration: duration,
      elevation: 0.0,
      content: Container(
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          color: theme.colorScheme.onBackground,
        ),
        child: Text(
          content,
          style: theme.primaryTextTheme.caption.copyWith(height: 1.2),
        ),
      ),
    );
  }

  static Widget buildSnackBarWithRightButton(
    BuildContext context,
    String content,
    String textButton,
    Function onButtonPressed, {
    TextStyle btnTextStyle,
    Duration duration = const Duration(seconds: 5),
  }) {
    ThemeData theme = SnackBarTheme().build(context);

    return SnackBar(
      backgroundColor: Colors.transparent,
      duration: duration,
      elevation: 0.0,
      content: Container(
        padding: const EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          color: theme.colorScheme.onBackground,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(child: Text(content, style: theme.primaryTextTheme.caption)),
            FlatButton(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                textButton.toUpperCase(),
                style: btnTextStyle ?? theme.textTheme.button.copyWith(color: theme.primaryColor),
              ),
              onPressed: () {
                if (onButtonPressed != null) {
                  onButtonPressed();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  static Widget buildSnackBarWithButtons(
    BuildContext context, {
    Color backgroundColor,
    @required String content,
    @required String positiveText,
    String negativeText,
    Color positiveColor,
    Color negativeColor,
    Function onPositivePressed,
    Function onNegativePressed,
    TextStyle positiveTextStyle,
    TextStyle negativeTextStyle,
    Duration duration = const Duration(seconds: 5),
  }) {
    ThemeData theme = SnackBarTheme().build(context);

    return SnackBar(
      backgroundColor: Colors.transparent,
      duration: duration,
      elevation: 0.0,
      content: Container(
        constraints: BoxConstraints(maxHeight: 100.0),
        padding: EdgeInsets.fromLTRB(15, 20, 15, 15),
        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5.0)), color: kColorBlack),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              content,
              style: theme.primaryTextTheme.caption.copyWith(color: kColorWhite),
              softWrap: false,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                      InkWell(
                          child: Text(
                            '${positiveText?.toUpperCase()}',
                            style: negativeTextStyle ??
                                TextStyle(
                                  color: positiveColor ?? theme.colorScheme.onSecondary,
                                  fontSize: theme.textTheme.body1.fontSize,
                                ),
                          ),
                          onTap: () {
                            if (onPositivePressed != null) {
                              onPositivePressed();
                            }
                          }),
                    ] +
                    (negativeText != null
                        ? [
                            Padding(
                              padding: EdgeInsets.only(left: 15),
                            ),
                            InkWell(
                              child: Text(
                                '${negativeText?.toUpperCase()}',
                                style: positiveTextStyle ?? TextStyle(color: negativeColor ?? theme.primaryColorDark, fontSize: theme.textTheme.body1.fontSize),
                              ),
                              onTap: () {
                                if (onNegativePressed != null) {
                                  onNegativePressed();
                                }
                              },
                            )
                          ]
                        : []),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static showSnackBar(BuildContext context, String content) {
    final snackBar = buildSnackBar(context, content);
    Scaffold.of(context).showSnackBar(snackBar);
  }

  static showSnackBarWithWidgetContent(BuildContext context, Widget content) {
    final snackBar = SnackBar(
      elevation: 0.0,
      content: content,
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  static Widget buildInfoSnackBar(
    BuildContext context,
    String content, {
    IconData icon,
    bool showIcon = false,
    Duration duration = const Duration(seconds: 5),
  }) {
    ThemeData theme = SnackBarTheme().build(context);

    return SnackBar(
        backgroundColor: Colors.transparent,
        duration: duration,
        elevation: 0.0,
        content: Container(
            padding: EdgeInsets.all(15.0),
            decoration: BoxDecoration(color: theme.colorScheme.onBackground, borderRadius: BorderRadius.all(Radius.circular(5.0))),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                showIcon
                    ? Padding(
                        child: Icon(
                          icon ?? Icons.info,
                          size: 15,
                          color: theme.primaryColor,
                        ),
                        padding: EdgeInsets.only(right: 10.0, top: 0.0),
                      )
                    : Container(height: 0),
                Expanded(
                    child: Text(
                  content,
                  style: theme.primaryTextTheme.caption,
                )),
              ],
            )));
  }

  static Widget buildErrorSnackBar(
    BuildContext context,
    String content, {
    Duration duration = const Duration(seconds: 5),
  }) {
    ThemeData theme = SnackBarTheme().build(context);

    return SnackBar(
        backgroundColor: Colors.transparent,
        duration: duration,
        elevation: 0.0,
        content: Container(
            padding: EdgeInsets.only(left: 15, right: 0, top: 15, bottom: 15),
            decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.all(Radius.circular(5.0))),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  child: Icon(
                    Icons.error,
                    size: 15,
                    color: Colors.red,
                  ),
                  padding: EdgeInsets.only(right: 10.0, top: 1.0),
                ),
                Container(
                    child: Text(
                  content,
                  style: theme.primaryTextTheme.caption,
                )),
              ],
            )));
  }

  static hideSnackBar(GlobalKey<ScaffoldState> scaffoldKey) {
    scaffoldKey?.currentState?.hideCurrentSnackBar();
  }
}
