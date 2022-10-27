library starter;

import 'dart:io';

import 'package:starter/helper.dart';

class Starter {
  static void start(List<String> arguments) async {
    final lib = Directory(Helper.libPath);

    if (!lib.existsSync()) {
      throw Exception("lib folder does not exists");
    }
    // Helper.createFolder(Helper.assetsPath);
    // Helper.createFolder("${Helper.assetsPath}/${Helper.imagePath}");
    // Helper.createFolder("${Helper.libPath}${Helper.screens}");
    // Helper.createFolder("${Helper.libPath}${Helper.widgets}");
    // Helper.createFolder("${Helper.libPath}${Helper.providers}");
    // Helper.createFolder("${Helper.libPath}${Helper.models}");
    // Helper.createFolder("${Helper.libPath}${Helper.utils}");
    // Helper.createFolder(
    //     "${Helper.libPath}${Helper.services}"); // for firebase or api

    // TODO: src path will be changed
    // Helper.moveFile("../lib/files/home_screen.txt",
    //     "${Helper.libPath}${Helper.screens}/home_screen.dart");
    // Helper.moveFile("../lib/files/app_assets.txt",
    //     "${Helper.libPath}${Helper.utils}/app_assets.dart");
    // Helper.moveFile("../lib/files/app_details.txt",
    //     "${Helper.libPath}${Helper.utils}/app_details.dart");
    // Helper.moveFile("../lib/files/constants.txt",
    //     "${Helper.libPath}${Helper.utils}/constants.dart");
    // Helper.moveFile("../lib/files/app_colors.txt",
    //     "${Helper.libPath}${Helper.utils}/app_colors.dart");
    // Helper.moveFile("../lib/files/session.txt",
    //     "${Helper.libPath}${Helper.utils}/session.dart");
    // Helper.moveFile("../lib/files/utils.txt",
    //     "${Helper.libPath}${Helper.utils}/utils.dart");

    // Adding commonly used packages/plugins
    Helper.addDependencies([
      "flutter_app_name",
      "change_app_package_name",
      "flutter_launcher_icons"
    ], dev: true);
    await Helper.addDependencies([
      "share_plus",
      "package_info_plus",
      "firebase_core",
      "shared_preferences",
      "internet_connection_checker",
      "flutter_riverpod",
    ]);
    // TODO: Replace with custom code
    // TODO: Not working
    // Helper.addPackage([
    //   'flutter_app_name:\n  name: "Recipe App"',
    // ]);

    print("Successfully created");
  }
}
