import 'dart:io';

import 'package:copy_template/copy_template.dart';
import 'package:dcli/dcli.dart';

void main(List<String> arguments) {
  late final String newAppName;

  late final String repositoryOfTemplate;

  late final String pathToInstall;

  /*
  3 arguments means all of the name, repository and path is given.
  0 arguments means nothing is given, user will continue to the cli.
   */
  if (!(arguments.length == 3 || arguments.isEmpty)) {
    printerr(ConstStrings.wrongNumberOfArguments);
    return;
  }

  if (arguments.length == 3) {
    // Check if arguments[0] obeys regexp for being a valid flutter name.
    if (!RegExp(r'^[a-z_]+$').hasMatch(arguments[0])) {
      printerr(ConstStrings.mustPassSnackCaseName);
      return;
    }

    newAppName = arguments[0];

    // Check if arguments[1] obeys regexp for a valid git repository or if
    // it is an existing directory in the computer.
    if (!(RegExp('^(https|git)://').hasMatch(arguments[1]) ||
        Directory(arguments[1]).existsSync())) {
      printerr(ConstStrings.repoOfTemplateText);
      return;
    }

    repositoryOfTemplate = arguments[1];

    pathToInstall = arguments[2];
  } else {
    // Arguments is empty therefore user will use interactive interface.
    newAppName = ask(
      ConstStrings.enterAppNameText,
      validator: Ask.regExp(
        r'^[a-z_]+$',
        error: ConstStrings.mustPassSnackCaseName,
      ),
    );

    String givenRepository = '_';

    // While given repository is not empty nor valid, ask again.
    while (!(givenRepository.isEmpty ||
        RegExp('^(https|git)://').hasMatch(givenRepository) ||
        Directory(givenRepository).existsSync())) {
      givenRepository = ask(
        ConstStrings.repoOfTemplateText,
        required: false,
      );
    }

    // If given repository address is empty, use default template.
    // Else use the given.
    givenRepository.isEmpty
        ? repositoryOfTemplate = ConstStrings.defaultTemplate
        : repositoryOfTemplate = givenRepository;

    final givenPath = ask(
      ConstStrings.pathToInstallText,
      required: false,
    );

    // If given path is empty, use current path.
    // Else use the given.
    givenPath.isEmpty
        ? pathToInstall = truepath(Directory.current.path)
        : pathToInstall = truepath(givenPath);
  }

  final branchOfTemplate = ask(
    ConstStrings.branchOfTemplate,
    required: false,
  );

  // Execute the operations.
  UseTemplate.instance.exec(
    newAppNameSnakeCase: newAppName,
    addressOfTemplate: repositoryOfTemplate,
    branchOfTemplate: branchOfTemplate,
    givenPath: pathToInstall,
  );
}
