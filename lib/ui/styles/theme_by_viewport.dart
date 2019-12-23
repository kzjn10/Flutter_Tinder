import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tinder/ui/constant/ui_constants.dart';

abstract class ThemeByViewPort {
  ThemeData _scaleTheme(ThemeData base, double scale) {
    final ThemeData theme = base.copyWith(
      textTheme: base.textTheme
          .copyWith(
            display4: base.textTheme.display4.copyWith(fontSize: base.textTheme.display4.fontSize * scale),
            display3: base.textTheme.display3.copyWith(fontSize: base.textTheme.display3.fontSize * scale),
            display2: base.textTheme.display2.copyWith(fontSize: base.textTheme.display2.fontSize * scale),
            display1: base.textTheme.display1.copyWith(fontSize: base.textTheme.display1.fontSize * scale),
            headline: base.textTheme.headline.copyWith(fontSize: base.textTheme.headline.fontSize * scale),
            title: base.textTheme.title.copyWith(fontSize: base.textTheme.title.fontSize * scale),
            subhead: base.textTheme.subhead.copyWith(fontSize: base.textTheme.subhead.fontSize * scale),
            body2: base.textTheme.body2.copyWith(fontSize: base.textTheme.body2.fontSize * scale),
            body1: base.textTheme.body1.copyWith(fontSize: base.textTheme.body1.fontSize * scale),
            caption: base.textTheme.caption.copyWith(fontSize: base.textTheme.caption.fontSize * scale),
            button: base.textTheme.button.copyWith(fontSize: base.textTheme.button.fontSize * scale),
            subtitle: base.textTheme.subtitle.copyWith(fontSize: base.textTheme.subtitle.fontSize * scale),
            overline: base.textTheme.overline.copyWith(fontSize: base.textTheme.overline.fontSize * scale),
          )
          .apply(fontFamily: 'GoogleSans'),
      primaryTextTheme: base.primaryTextTheme
          .copyWith(
            display4: base.primaryTextTheme.display4.copyWith(fontSize: base.primaryTextTheme.display4.fontSize * scale),
            display3: base.primaryTextTheme.display3.copyWith(fontSize: base.primaryTextTheme.display3.fontSize * scale),
            display2: base.primaryTextTheme.display2.copyWith(fontSize: base.primaryTextTheme.display2.fontSize * scale),
            display1: base.primaryTextTheme.display1.copyWith(fontSize: base.primaryTextTheme.display1.fontSize * scale),
            headline: base.primaryTextTheme.headline.copyWith(fontSize: base.primaryTextTheme.headline.fontSize * scale),
            title: base.primaryTextTheme.title.copyWith(fontSize: base.primaryTextTheme.title.fontSize * scale),
            subhead: base.primaryTextTheme.subhead.copyWith(fontSize: base.primaryTextTheme.subhead.fontSize * scale),
            body2: base.primaryTextTheme.body2.copyWith(fontSize: base.primaryTextTheme.body2.fontSize * scale),
            body1: base.primaryTextTheme.body1.copyWith(fontSize: base.primaryTextTheme.body1.fontSize * scale),
            caption: base.primaryTextTheme.caption.copyWith(fontSize: base.primaryTextTheme.caption.fontSize * scale),
            button: base.primaryTextTheme.button.copyWith(fontSize: base.primaryTextTheme.button.fontSize * scale),
            subtitle: base.primaryTextTheme.subtitle.copyWith(fontSize: base.primaryTextTheme.subtitle.fontSize * scale),
            overline: base.primaryTextTheme.overline.copyWith(fontSize: base.primaryTextTheme.overline.fontSize * scale),
          )
          .apply(fontFamily: 'GoogleSans'),
      iconTheme: base.iconTheme.copyWith(size: 23 * scale),
      accentIconTheme: base.accentIconTheme.copyWith(size: 23 * scale),
      primaryIconTheme: base.primaryIconTheme.copyWith(size: 23 * scale),
    );

    return theme;
  }

  ThemeData extendTablet(BuildContext context, {ThemeData themeData}) {
    return themeData ?? Theme.of(context);
  }

  ThemeData extendByViewPortSize(ThemeData themeData, BuildContext context) {
    ThemeData _extThemeData;
    final double _viewPortSize = window.physicalSize.width / window.devicePixelRatio;
    final ThemeData _base = themeData ?? Theme.of(context);

    // Initializing typography for each screen size
    if (_viewPortSize <= UiConstants.MAX_MOBILE_VIEWPORT_SIZE) {
      _extThemeData = _base;
    } else if (_viewPortSize > UiConstants.MAX_MOBILE_VIEWPORT_SIZE && _viewPortSize <= UiConstants.MAX_VIEWPORT_SIZE) {
      _extThemeData = _scaleTheme(_base, math.min(_viewPortSize / UiConstants.BASE_VIEWPORT_SIZE, UiConstants.MAX_SCALE));
    } else {
      _extThemeData = _scaleTheme(_base, math.min(_viewPortSize / UiConstants.BASE_VIEWPORT_SIZE, UiConstants.TABLET_MAX_SCALE));
    }

    return _extThemeData;
  }
}
