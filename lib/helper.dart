import 'dart:io';

abstract class Helper {
  static const String libPath = 'lib/';

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
      var file = File("pubspec.yaml");
      if (file.existsSync()) {
        var result = await Process.run(
            !dev ? "flutter pub add" : "flutter pub add -d", packageNames,
            runInShell: true);

        print(result.exitCode.toString());

        print("added some $name");
      } else {
        print("pubspec.yaml does not exists");
      }
    } catch (e) {
      print("Error occured while adding $name : ${e.toString()}");
    }
  }

  static void addPackage(List<String> packageNames) {
    try {
      var file = File("pubspec.yaml");
      if (file.existsSync()) {
        final packages = packageNames.map((e) => "  $e:\n").join();
        final contents = file.readAsStringSync();
        // final i = contents.indexOf("flutter:");
        // print(i);
        // file.writeAsStringSync(contents);

      } else {
        print("pubspec.yaml does not exists");
      }
    } catch (e) {
      print("Error occured while adding package: ${e.toString()}");
    }
  }

  static Future<void> processRun() async {}
}
