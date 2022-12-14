library starter;

import 'dart:io';

import 'helper.dart';

class Starter {
  static void process(List<String> arguments) async {
    final lib = Directory(Helper.libPath);

    if (!lib.existsSync()) {
      throw Exception("lib folder does not exists.");
    }

    if (!Helper.pubspecFile.existsSync()) {
      throw Exception("pubspec.yaml does not exists.");
    }
    print("Please wait, process has started..");
    print("Creating assets folder..");
    Helper.createFolder(Helper.assetsPath);
    Helper.createFolder("${Helper.assetsPath}/${Helper.imagePath}");
    print("Creating folder structure..");
    Helper.createFolder("${Helper.libPath}${Helper.screens}");
    Helper.createFolder("${Helper.libPath}${Helper.widgets}");
    Helper.createFolder("${Helper.libPath}${Helper.providers}");
    Helper.createFolder("${Helper.libPath}${Helper.models}");
    Helper.createFolder("${Helper.libPath}${Helper.utils}");
    Helper.createFolder(
        "${Helper.libPath}${Helper.services}"); // for firebase or api

    // TODO: src path will be changed
    print("Creating helper files..");
    Helper.moveFile("../lib/files/home_screen.txt",
        "${Helper.libPath}${Helper.screens}/home_screen.dart");
    Helper.moveFile("../lib/files/app_assets.txt",
        "${Helper.libPath}${Helper.utils}/app_assets.dart");
    Helper.moveFile("../lib/files/app_details.txt",
        "${Helper.libPath}${Helper.utils}/app_details.dart");
    Helper.moveFile("../lib/files/constants.txt",
        "${Helper.libPath}${Helper.utils}/constants.dart");
    Helper.moveFile("../lib/files/app_colors.txt",
        "${Helper.libPath}${Helper.utils}/app_colors.dart");
    Helper.moveFile("../lib/files/session.txt",
        "${Helper.libPath}${Helper.utils}/session.dart");
    Helper.moveFile("../lib/files/utils.txt",
        "${Helper.libPath}${Helper.utils}/utils.dart");

    // Adding commonly used packages/plugins
    print("Adding commonly used packages/plugins..");
    await Helper.addDependencies(
        ["change_app_package_name", "flutter_launcher_icons"],
        dev: true);
    await Helper.addDependencies([
      "share_plus",
      "package_info_plus",
      "firebase_core",
      "shared_preferences",
      "internet_connection_checker",
      "flutter_riverpod"
    ]);
    print("Enabling assets for projects..");
    Helper.enableAssets();

    Helper.addPackageSection([
      '# Change Launcher Icon -> Run command -> flutter pub run flutter_launcher_icons:main\nflutter_icons:\n  android: "ic_launcher"\n  image_path: "assets/images/icon.png" # Your icon path\n'
    ]);

    print("Renaming project..");
    Helper.renameProject();

    // running pub get command
    print("Running pub get");
    Helper.runPubGet();

    print("Successfully created starter project, enjoy????");
  }
}
