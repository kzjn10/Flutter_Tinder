import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tinder/ui/styles/theme_by_viewport.dart';

import 'colors.dart';

class AppTheme extends ThemeByViewPort {
//  static const Color primaryColor = kColorBlue;
  static const Color primaryColor = kColorPurple;
  static const Color primaryColorBare = kColorBlueBare;
  static const Color accentColor = kColorOrange;
  static const Color disabledColor = kColorGrayLight;
  static const Color hintColor = kColorGray;
  static const Color cardBorderColor = kColorGrayLight;
  static const Color placeholderColor = kColorGrayLighter;
  static const Color placeholderHighlightColor = kColorGrayBare;

  // Status Colors

  static const Color onGoingStatusColor = kColorGreen;
  static const Color liveStatusColor = kColorRed;

  static const Color onlineStatusColor = onGoingStatusColor;
  static const Color awayStatusColor = kColorGray;

  ///event date color
  static const Color onGoingEventDateColor = kColorGreen;
  static const Color pastEventDateColor = kColorRed;
  static const Color defaultEventDateColor = primaryColor;

  ThemeData build(BuildContext context, {Brightness brightness}) {
    var themeData = _buildBaseAppTheme(context, brightness: brightness);
    themeData = extendByViewPortSize(themeData, context);
    return themeData;
  }

  ThemeData _buildBaseAppTheme(BuildContext context, {Brightness brightness = Brightness.light}) {
    Color textColor = (brightness == Brightness.light) ? kColorBlack : kColorWhite;
    ThemeData base =
        Theme.of(context).copyWith(textTheme: Theme.of(context).textTheme.apply(fontFamily: 'GoogleSans', bodyColor: kColorBlack, decorationColor: kColorGrayDark, displayColor: kColorBlack));

    return base.copyWith(
      brightness: brightness,
      platform: defaultTargetPlatform == TargetPlatform.iOS ? TargetPlatform.iOS : TargetPlatform.android,
      accentColor: kColorOrange,
      accentColorBrightness: Brightness.dark,
      scaffoldBackgroundColor: brightness == Brightness.light ? kColorWhite : kColorBlack,
      backgroundColor: brightness == Brightness.light ? kColorWhite : kColorBlack,
      primaryColor: primaryColor,
      primaryColorDark: kColorPrimaryDark,
      primaryColorLight: kColorPrimaryLight,
      errorColor: kColorRed,
      toggleableActiveColor: kColorOrange,
      disabledColor: kColorGrayLight,
      unselectedWidgetColor: kColorGray,
      highlightColor: kColorTransparent,
      textSelectionColor: kColorYellowLightA1,
      bottomAppBarColor: kColorWhite,
      hintColor: kColorGray,
      splashColor: kColorGrayBareA1,
      cardColor: kColorWhite,
//      canvasColor: kColorTransparent,
      dividerColor: kColorGrayLight,
      cursorColor: primaryColor,
      buttonColor: kColorBlueDark,
      indicatorColor: kColorGrayLight,
      inputDecorationTheme: base.inputDecorationTheme.copyWith(
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: kColorBlackLight, width: 1),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: primaryColor, width: 1),
        ),
      ),
      iconTheme: base.iconTheme.copyWith(color: kColorBlack, size: 32),
      accentIconTheme: base.accentIconTheme.copyWith(color: primaryColor, size: 32),
      primaryIconTheme: base.primaryIconTheme.copyWith(color: kColorWhite, size: 32),
      accentTextTheme: base.accentTextTheme.copyWith(
          button: base.accentTextTheme.button.copyWith(color: primaryColor),
          title: base.accentTextTheme.button.copyWith(color: primaryColor),
          body1: base.accentTextTheme.button.copyWith(color: primaryColor)),
      textTheme: base.textTheme.copyWith(
          // MD-headline1
          display4: base.textTheme.display4.copyWith(color: textColor, fontWeight: FontWeight.w700, fontSize: 34.0),

          // MD-headline2
          display3: base.textTheme.display3.copyWith(color: textColor, fontWeight: FontWeight.w500, fontSize: 34.0),

          // MD-headline3
          display2: base.textTheme.display2.copyWith(
            color: textColor,
            fontWeight: FontWeight.w700,
            fontSize: 28.0,
          ),

          // MD-headline4
          display1: base.textTheme.display1.copyWith(
            color: textColor,
            fontWeight: FontWeight.w500,
            fontSize: 25.0,
          ),

          // MD-headline5
          headline: base.textTheme.headline.copyWith(
            color: textColor,
            fontWeight: FontWeight.w500,
            fontSize: 22.0,
          ),

          // MD-headline6
          title: base.textTheme.title.copyWith(
            color: textColor,
            fontWeight: FontWeight.w700,
            fontSize: 25.0,
          ),

          // MD-subtitle1
          subhead: base.textTheme.subhead.copyWith(
            color: textColor,
            fontWeight: FontWeight.w400,
            fontSize: 16.0,
          ),

          // MD-body1
          body2: base.textTheme.body2.copyWith(
            color: textColor,
            fontWeight: FontWeight.w500,
            fontSize: 15.5,
          ),

          // MD-body2
          body1: base.textTheme.body1.copyWith(
            color: textColor,
            fontWeight: FontWeight.w400,
            fontSize: 15.5,
          ),

          // MD-caption
          caption: base.textTheme.caption.copyWith(
            color: textColor,
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
          ),

          // MD-button
          button: base.textTheme.button.copyWith(
            color: textColor,
            fontWeight: FontWeight.w500,
            fontSize: 15.5,
          ),

          // MD-subtitle2
          subtitle: base.textTheme.subtitle.copyWith(
            color: textColor,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),

          // MD-overline
          overline: base.textTheme.overline.copyWith(color: textColor, fontWeight: FontWeight.w400, fontSize: 12.0, letterSpacing: 0.5)),
      primaryTextTheme: base.primaryTextTheme.copyWith(

          // MD-headline1
          display4: base.primaryTextTheme.display4.copyWith(color: kColorWhite, fontWeight: FontWeight.w700, fontSize: 34.0),

          // MD-headline2
          display3: base.primaryTextTheme.display3.copyWith(color: kColorWhite, fontWeight: FontWeight.w500, fontSize: 34.0),

          // MD-headline3
          display2: base.primaryTextTheme.display2.copyWith(
            color: kColorWhite,
            fontWeight: FontWeight.w700,
            fontSize: 28.0,
          ),

          // MD-headline4
          display1: base.primaryTextTheme.display1.copyWith(
            color: kColorWhite,
            fontWeight: FontWeight.w500,
            fontSize: 25.0,
          ),

          // MD-headline5
          headline: base.primaryTextTheme.headline.copyWith(
            color: kColorWhite,
            fontWeight: FontWeight.w500,
            fontSize: 22.0,
          ),

          // MD-headline6
          title: base.primaryTextTheme.title.copyWith(
            color: kColorWhite,
            fontWeight: FontWeight.w700,
            fontSize: 25.0,
          ),

          // MD-subtitle1
          subhead: base.primaryTextTheme.subhead.copyWith(
            color: kColorWhite,
            fontWeight: FontWeight.w400,
            fontSize: 16.0,
          ),

          // MD-body1
          body2: base.primaryTextTheme.body2.copyWith(
            color: kColorWhite,
            fontWeight: FontWeight.w500,
            fontSize: 15.5,
          ),

          // MD-body2
          body1: base.primaryTextTheme.body1.copyWith(
            color: kColorWhite,
            fontWeight: FontWeight.w400,
            fontSize: 15.5,
          ),

          // MD-caption
          caption: base.primaryTextTheme.caption.copyWith(
            color: kColorWhite,
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
          ),

          // MD-button
          button: base.primaryTextTheme.button.copyWith(
            color: kColorWhite,
            fontWeight: FontWeight.w500,
            fontSize: 15.5,
          ),

          // MD-subtitle2
          subtitle: base.primaryTextTheme.subtitle.copyWith(
            color: kColorWhite,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),

          // MD-overline
          overline: base.primaryTextTheme.overline.copyWith(color: kColorWhite, fontWeight: FontWeight.w400, fontSize: 12.0, letterSpacing: 0.5)),
      chipTheme: base.chipTheme.copyWith(
          backgroundColor: kColorGrayBare,
          disabledColor: kColorGrayLighter,
          selectedColor: kColorGrayDark,
          secondarySelectedColor: kColorOrangeDark,
          labelPadding: EdgeInsets.symmetric(horizontal: 12.0),
          padding: EdgeInsets.all(0.0),
          shape: StadiumBorder(),
          labelStyle: TextStyle(color: kColorGrayDark, fontSize: 15.5),
          secondaryLabelStyle: TextStyle(
            color: kColorGrayDark,
          ),
          brightness: Brightness.dark),
      buttonTheme: ButtonThemeData(
          highlightColor: kColorTransparent,
          splashColor: kColorGrayBareA1,
          colorScheme: base.buttonTheme.colorScheme.copyWith(
              primary: base.primaryColor,
              primaryVariant: base.primaryColorDark,
              secondary: kColorSecondary1,
              secondaryVariant: kColorSecondary1Dark,
              surface: base.primaryColor,
              onSurface: kColorWhite,
              brightness: brightness,
              onSecondary: kColorWhite,
              onPrimary: kColorWhite,
              onError: kColorWhite,
              onBackground: kColorBlack,
              error: base.errorColor,
              background: kColorGrayLight)),
      colorScheme: base.colorScheme.copyWith(
          onPrimary: kColorWhite,
          background: brightness == Brightness.light ? kColorWhite : kColorBlack,
          brightness: brightness,
          error: kColorError,
          onBackground: brightness == Brightness.light ? kColorBlack : kColorWhite,
          onError: kColorWhite,
          onSecondary: kColorLightGray,
          primary: kColorBlue,
          primaryVariant: kColorBlueDark,
          secondary: kColorOrange,
          secondaryVariant: kColorOrangeDark,
          surface: kColorWhite,
          onSurface: kColorGrayDark),
    );
  }
}
