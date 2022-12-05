import 'dart:async';

import 'package:args/command_runner.dart';
import 'package:dcli/dcli.dart';

import 'argument_parser.dart';
import 'steps/build_flavor_step.dart';
import 'steps/configure_mixer_step.dart';
import 'steps/git_check_step.dart';
import 'steps/prepare_project_directory_step.dart';
import 'steps/substep_step.dart';

class FullBuildCommand extends Command<void> {
  @override
  String get description => 'build all flavor for project';

  @override
  String get name => 'full_build';

  @override
  ArgParser get argParser => getDefaultArgParser();

  @override
  FutureOr<void> run() async {
    await setArguments(argResults);
    checkBuildTargets();

    final step = SubstepStep(
      [
        GitCheckStep(),
        // configure build system
        ConfigureMixerStep(),
        PrepareProjectDirectoryStep(),
        BuildAllFlavorStep(),
      ],
      name: 'Build',
    );

    print(green('start build application in directory $pwd'));
    await step.run();
  }
}
