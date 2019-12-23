import 'package:flutter/material.dart';
import 'package:tinder/ui/styles/theme_by_viewport.dart';

class SnackBarTheme extends ThemeByViewPort {
  ThemeData build(BuildContext context) {
    var base = Theme.of(context);

    var themeData = base.copyWith(
      accentColor: base.accentColor,
      accentColorBrightness: base.accentColorBrightness,
      colorScheme: base.colorScheme.copyWith(
        onBackground: base.brightness == Brightness.light ? base.colorScheme.onBackground : base.colorScheme.background,
        background: base.brightness == Brightness.light ? base.colorScheme.background : base.colorScheme.onBackground,
      ),
      textTheme: base.textTheme.apply(
        fontFamily: 'GoogleSans',
        bodyColor: base.brightness == Brightness.light ? base.colorScheme.onBackground : base.colorScheme.background,
      ),
    );

    themeData = extendByViewPortSize(themeData, context);

    return themeData;
  }
}
