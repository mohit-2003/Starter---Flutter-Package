import 'dart:io';

abstract class Helper {
  static const String libPath = 'lib/';
  static final File pubspecFile = File("pubspec.yaml");

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
      print("enabling assets");
    } catch (e) {
      print("Error occured while enabling assets : ${e.toString()}");
    }
  }

  static void addPackageSection(List<String> packageSections) {
    try {
      final packages = packageSections.map((e) => "$e\n").join();
      final contents = pubspecFile.readAsStringSync();
      pubspecFile.writeAsStringSync('$contents\n$packages');
    } catch (e) {
      print("Error occured while adding package: ${e.toString()}");
    }
  }

  static Future<void> runCommand(
      String command, [List<String>? arguments]) async {
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
}
