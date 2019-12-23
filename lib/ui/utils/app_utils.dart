import 'dart:io';

import 'package:ice_tea_studio_plugins/ice_tea_studio_plugins.dart';
import 'package:package_info/package_info.dart';
import 'package:tinder/core/core.dart';

class AppUtils {
  static Future<String> get platformVersion async {
    return await NativeUtilsPlugin.platformVersion;
  }
}

Future<ApplicationInfo> getApplicationInfo() async {
  var info = await PackageInfo.fromPlatform();
  return ApplicationInfo(
    platform: Platform.operatingSystem,
    appName: info?.appName,
    buildNumber: info?.buildNumber,
    packageName: info?.packageName,
    version: info?.version,
  );
}
