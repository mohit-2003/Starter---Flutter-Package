// ignore_for_file: unnecessary_string_escapes

import 'dart:io';

import 'package:yaml/yaml.dart';

abstract class Helper {
  static const String starterKey = 'starter';
  static const String libPath = 'lib/';
  static final File pubspecFile = File("pubspec.yaml");
  static final File manifestFile =
      File("android/app/src/main/AndroidManifest.xml");

  /// Folders name
  static const String assetsPath = 'assets';
  static const String imagePath = 'images';
  static const String screens = 'screens';
  static const String widgets = 'widgets';
  static const String models = 'models';
  static const String providers = 'providers';
  static const String utils = 'utils';
  static const String services = 'services';

  static void createFolder(String path) async {
    try {
      final folder = Directory(path);
      if (!folder.existsSync()) {
        folder.createSync();
      }
    } catch (e) {
      print("Error occured while creating folders : ${e.toString()}");
    }
  }

  static void moveFile(String srcPath, String distPath) {
    try {
      var srcFile = File(srcPath);
      final contents = srcFile.readAsBytesSync();
      var distFile = File(distPath);
      if (!distFile.existsSync()) {
        distFile.createSync();
        distFile.writeAsBytesSync(contents);
      }
    } catch (e) {
      print("Error occured while moving files : ${e.toString()}");
    }
  }

  static Future<void> addDependencies(List<String> packageNames,
      {bool dev = false}) async {
    final name = dev ? "dev_dependencies" : "dependencies";
    try {
      await Process.run(
          !dev ? "flutter pub add" : "flutter pub add -d", packageNames,
          runInShell: true);

      print("added some $name");
    } catch (e) {
      print("Error occured while adding $name : ${e.toString()}");
    }
  }

  static void enableAssets() async {
    try {
      final contents = pubspecFile.readAsStringSync();
      final i = contents.replaceFirst("# assets:", '''assets:
    - assets/images''');
      pubspecFile.writeAsStringSync(i);
    } catch (e) {
      print("Error occured while enabling assets : ${e.toString()}");
    }
  }

  static void addPackageSection(List<String> packageSections) {
    try {
      final contents = pubspecFile.readAsStringSync();
      if (contents.contains("flutter_icons")) return;

      final packages = packageSections.map((e) => "$e\n").join();
      pubspecFile.writeAsStringSync('$contents\n$packages');
    } catch (e) {
      print("Error occured while adding package: ${e.toString()}");
    }
  }

  static Future<void> runCommand(String command,
      [List<String>? arguments]) async {
    try {
      await Process.run(command, arguments ?? [], runInShell: true);
    } catch (e) {
      print("Error occured while running command : ${e.toString()}");
    }
  }

  static void runPubGet() async {
    try {
      await Process.run("flutter pub get", [], runInShell: true);
    } catch (e) {
      print("Error occured while enabling assets : ${e.toString()}");
    }
  }

  static void renameProject() {
    final Map yamlData = loadYaml(pubspecFile.readAsStringSync());
    final Map? keys = yamlData[starterKey];

    if (keys == null) {
      throw Exception("pubspec.yaml file must have a key $starterKey.");
    }
    final String? appName = keys["app_name"];
    final String? package = keys["package"];
    final String? icon = keys["icon"];

    if (appName == null) {
      throw Exception(
          "You must set the app name under the '$starterKey' section of your pubspec.yaml file.");
    }

    /// Changing the app name in the AndroidManifest.xml file.
    print("Changing app name..");
    _changeAppName(appName);

    if (package == null) {
      throw Exception(
          "You must set the package name under the '$starterKey' section of your pubspec.yaml file.");
    }

    /// Changing the package name
    print("Changing the package name");
    _changePackageName(package);
  }

  static void _changeAppName(String appName) {
    final manifestData = manifestFile.readAsLinesSync();
    final androidLabel = manifestData
        .where((element) => element.contains("android:label"))
        .toList();

    if (androidLabel.isEmpty) {
      throw Exception("Could not find 'android:label' in ${manifestFile.path}");
    }

    print(
        "Old app name : ${androidLabel.first.trim().split("=").last.replaceAll('\"', "")}");

    manifestFile.writeAsStringSync(manifestFile
        .readAsStringSync()
        .replaceAll(androidLabel.first, 'android:label="$appName"'));

    print("New app name : $appName");
  }

  static Future<void> _changePackageName(String package) async {
    await Helper.runCommand(
        "flutter pub run change_app_package_name:main", [package]);
  }
}
