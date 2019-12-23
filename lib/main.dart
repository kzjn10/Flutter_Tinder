import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:http/io_client.dart';
import 'package:tinder/core/client_core_config.dart';
import 'package:tinder/ui/integration/app_client_data/app_data_repository.dart';
import 'package:tinder/ui/screens/screens.dart';

import 'core/contants/global.dart';
import 'generated/i18n.dart';
import 'style/theme_base.dart';
import 'ui/utils/app_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ClientCoreConfig().configure(
    flavor: Flavor.PROD,
    client: IOClient(HttpClient()),
    appInfo: await getApplicationInfo(),
    appClientDataRepository: AppClientDataRepository(),
  );

  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tinder',
      theme: buildBaseAppTheme(context, Brightness.light),
      home: MyHomePage(),
      locale: Locale("en", ""),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      localeResolutionCallback: S.delegate.resolution(fallback: Locale('en', '')),
    );
  }
}
