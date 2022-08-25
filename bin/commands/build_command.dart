import 'dart:async';

import 'package:args/command_runner.dart';
import 'package:dcli/dcli.dart';

import 'argument_parser.dart';
import 'steps/build_flavor_step.dart';
import 'steps/configure_mixer_step.dart';
import 'steps/git_check_step.dart';
import 'steps/substep_step.dart';

class BuildCommand extends Command<void> {
  @override
  String get description => 'build application with selected flavor';

  @override
  String get name => 'build';

  @override
  ArgParser get argParser => getDefaultArgParser()
    ..addOption(
      'flavor',
      help: 'which flavor build',
      mandatory: true,
    );

  @override
  FutureOr<void> run() async {
    await setArguments(argResults);
    final flavor = argResults?['flavor'] as String?;

    final step = SubstepStep(
      [
        GitCheckStep(),
        // configure build system
        ConfigureMixerStep(),
        buildFlavorStep(flavor)
      ],
      name: 'Build',
    );

    print(green('start build application in directory $pwd'));
    await step.run();
  }
}
