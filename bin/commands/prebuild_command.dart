import 'dart:async';

import 'package:args/command_runner.dart';
import 'package:dcli/dcli.dart';

import '../fvm/detect_fvm.dart';
import '../fvm/fvm_provider.dart';
import '../ref.dart';
import '../version/version_provider.dart';
import 'argument_parser.dart';
import 'steps/apply_flavor_overrides_step.dart';
import 'steps/configure_flavor_step.dart';
import 'steps/configure_mixer_step.dart';
import 'steps/git_check_step.dart';
import 'steps/prebuild_step.dart';
import 'steps/replace_flavor_params_step.dart';
import 'steps/substep_step.dart';

class PrebuildCommand extends Command<void> {
  @override
  String get description => 'prepare flavor for build';

  @override
  String get name => 'prebuild';

  @override
  ArgParser get argParser => ArgParser()
    ..addOption(
      'flavor',
      help: 'which flavor to build, can be omit for flat project type',
    )
    ..addOption(
      'version',
      help: 'override application version in format v0.0.0+0',
    )
    ..addFlag(
      'use-fvm',
      help: 'use `fvm flutter` instead of `flutter` command',
    );

  @override
  FutureOr<void> run() async {
    final flavor = getFlavor(argResults);

    ref.read(versionProvider.notifier).update((_) => getVersion(argResults));
    ref.read(useFvmProvider.notifier).update((_) => getUseFvm(argResults));

    final step = SubstepStep(
      [
        GitCheckStep(),
        // configure build system
        ConfigureMixerStep(),
        ConfigureFlavorStep(userSelectedFlavor: flavor ?? 'fallback'),

        // configure project before build
        ApplyFlavorOverridesStep(),
        PrebuildStep(),
        ReplaceFlavorParamsStep(),
      ],
      name: 'Build',
    );

    print(green('start build application in directory $pwd'));
    await step.run();
  }
}
