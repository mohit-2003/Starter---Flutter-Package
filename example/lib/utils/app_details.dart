import 'package:package_info_plus/package_info_plus.dart';

class AppDetails {
  static String appName = "";
  static String packageName = "";
  static String versionName = "1.0.0";
  static String versionCode = "1";

  AppDetails() {
    _init();
  }

  void _init() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appName = packageInfo.appName;
    packageName = packageInfo.packageName;
    versionName = packageInfo.version;
    packageName = packageInfo.buildNumber;
  }
}
