import 'package:flutter/material.dart';
import 'app_details.dart';
import 'constants.dart';
import 'package:share_plus/share_plus.dart';

class Utils {
  static void share(String text) async {
    await Share.share(text);
  }

  static void shareApp() async {
    await Share.share(
        "Download ${Constants.appName}\nhttps://play.google.com/store/apps/details?id=${AppDetails.packageName}");
  }

  static void showSnackbar(
      {required BuildContext context,
      required String msg,
      String? actionText,
      VoidCallback? onActionButtonPressed}) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
        content: new Text(msg),
        action: actionText != null
            ? new SnackBarAction(
                label: actionText, onPressed: onActionButtonPressed ?? () {})
            : null));
  }
}
