part of '../copy_template.dart';

/// Static class to hold constants.
class ConstStrings {
  /// Tells the user that the number of arguments is wrong.
  static const wrongNumberOfArguments =
      'You have passed wrong number of arguments. '
      'Pass 3(name, repository, path)'
      ' or none if you want to continue with command line interface. \n'
      r'Example usage: copy_template my_new_flutter_app https://github.com/cogivn/flutter.git C:\Users\cogivn\Desktop\my_new_app_name '
      '\nor just run copy_template with any arguments to use interactive cli.';

  /// Default template.
  static const defaultTemplate = 'https://github.com/cogivn/flutter.git';

  /// Enter new app's name text.
  static const enterAppNameText = 'Enter your new app name: ';

  /// You must pass a snack case text.
  static const mustPassSnackCaseName =
      'You must pass a snack case name like my_new_app_name';

  /// Repository of template text.
  static const repoOfTemplateText =
      'Repository url(default: $defaultTemplate): ';

  /// Path to install text.
  static const String pathToInstallText = 'Target directory(default: current path): ';

  /// The target branch to clone source from repos.
  static const String branchOfTemplate = 'Branch(default: master): ';

  /// Couldn't create directory text.
  static const String couldntCreateDirectory =
      'Could not create directory to clone repository!';

  /// Couldn't clone repository text.
  static const String couldntCloneRepository = 'Could not clone repository!';

  /// Couldn't copy files from template text.
  static const String couldntCopyFilesFromTemplate =
      'Could not copy files from template folder!';

  /// Couldnt find directory text.
  static const String noDirectory = 'No such directory exists in your computer!';

  /// Couldnt find pubspec.yaml text.
  static const String noPubspec =
      'There is no pubspec.yaml file in template directory. That means it is not a valid Flutter project.';

  /// Couldn't get old name text.
  static const String couldntGetOldName = 'Could not get old name from pubspec.yaml!';

  /// Couldn't find directory text.
  static String couldntFindDir(String dirName) {
    return "Couldn't found $dirName directory, probably your app doesn't have a $dirName project.";
  }

  /// Couldn't change name text.
  static String couldntChangeName(String platformName) {
    return 'Could not change $platformName name, you have to change manually!';
  }

  /// Couldn't change imports text.
  static String couldntChangeImports(String folderName) {
    return 'Could not change $folderName imports, you have to change manually!';
  }

  /// Couldn't remove old git files text.
  static String couldntRemoveOldGit =
      'Could not remove old git files, you have to remove manually!';

  /// Couldn't run 'flutter pub get' text.
  static String couldntRunPubGet =
      "Could not run 'flutter pub get'. Run it manually!";
}
