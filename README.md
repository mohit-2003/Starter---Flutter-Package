# Flutter App Name 

A command-line tool that makes your normal project to starter project.

## What it does? 

- [x] Creates Folder Structure
- [x] Creates Assets Folder
- [x] Add Some files such as utils, app_assets, constants etc.
- [x] Add commonly used packages/plugins
- [x] Rename project (App Name, Package)

# Usage

1. Add this to your package's pubspec.yaml file:

```
dev_dependencies:
  starter: <latest-version>

starter:
  app_name: "Your App Name"
  package: "com.example.your_app_name"
```

2. Run this command in your project's directory

```
flutter pub get
flutter pub run starter
```