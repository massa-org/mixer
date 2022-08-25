import 'dart:async';

import 'package:args/command_runner.dart';
import 'package:dcli/dcli.dart';

import 'steps/android_sign_step.dart';
import 'steps/apply_flavor_overrides_step.dart';
import 'steps/configure_flavor_step.dart';
import 'steps/configure_mixer_step.dart';
import 'steps/configure_secrets_step.dart';
import 'steps/prebuild_step.dart';
import 'steps/substep_step.dart';

class BuildCommand extends Command<void> {
  @override
  String get description => 'build application with selected flavor';

  @override
  String get name => 'build';

  @override
  ArgParser get argParser => ArgParser()
    ..addOption(
      'deploy',
      help: 'deploy strategy',
      allowed: ['none', 'internal', 'beta', 'release'],
      defaultsTo: 'none',
    )
    ..addOption(
      'flavor',
      help: 'which flavor build',
    )
    ..addOption(
      'secrets',
      help: 'secrets provider for build',
      allowed: ['git', 'env', 'testing'],
      defaultsTo: 'git',
    )
    ..addOption(
      'secretsRepository',
      help: 'git secret repository, by default use env SECRETS_REPOSITORY',
    );

  @override
  FutureOr<void> run() async {
    final step = SubstepStep(
      [
        // configure build system
        SubstepStep(
          [
            ConfigureMixerStep(),
            ConfigureFlavorStep(
              userSelectedFlavor: argResults?['flavor'] as String?,
            ),
            ConfigureSecretsStep(),
          ],
          name: 'ConfureBuildSystem',
        ),

        // configure project before build
        ApplyFlavorOverridesStep(),
        PrebuildStep(),

        // build
        AndroidSignStep(),
      ],
      name: 'Build',
    );

    print(green('start build application in directory $pwd'));
    await step.run();
  }
}
