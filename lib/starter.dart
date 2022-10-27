library starter;

import 'dart:io';

import 'package:starter/helper.dart';

class Starter {
  static void start(List<String> arguments) async {
    final lib = Directory(Helper.libPath);

    if (!lib.existsSync()) {
      throw Exception("lib folder does not exists");
    }

    if (!Helper.pubspecFile.existsSync()) {
      print("pubspec.yaml does not exists");
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
    // Helper.addDependencies([
    //   "flutter_app_name",
    //   "change_app_package_name",
    //   "flutter_launcher_icons"
    // ], dev: true);
    // await Helper.addDependencies([
    //   "share_plus",
    //   "package_info_plus",
    //   "firebase_core",
    //   "shared_preferences",
    //   "internet_connection_checker",
    //   "flutter_riverpod"
    // ]);
    // TODO: Replace with own code
    // Helper.addPackageSection([
    //   '# Change app name -> Run command -> flutter pub run flutter_app_name\nflutter_app_name:\n  name: "Recipe App" # Your app name\n',
    //   '# Change Launcher Icon -> Run command -> flutter pub run flutter_launcher_icons:main\nflutter_icons:\n  android: "ic_launcher"\n  image_path: "assets/images/icon.png" # Your icon path\n'
    // ]);

    // Helper.enableAssets();

    await Helper.runCommand("flutter pub run flutter_app_name");
    await Helper.runCommand("flutter pub run change_app_package_name:main",
        arguments = ["com.new.package.name"]);
    await Helper.runCommand("flutter pub run flutter_launcher_icons:main");

    // running pub get command
    // Helper.runPubGet();

    print("Successfully created");
  }
}
