import 'dart:async';

import 'package:args/command_runner.dart';
import 'package:dcli/dcli.dart';

import '../ref.dart';
import '../secrets_provider/secrets_provider.dart';
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
    final flavor = argResults?['flavor'] as String?;
    final secrets = argResults?['secrets'] as String?;
    // TODO configure secretsRepository from args
    if (secrets != null) {
      ref.read(selectedSecretsProvider.notifier).update((_) => secrets);
      await Future.microtask(() => null);
    }

    final step = SubstepStep(
      [
        GitCheckStep(),
        // configure build system
        ConfigureMixerStep(),
        if (flavor == null) BuildAllFlavorStep() else buildFlavorStep(flavor)
      ],
      name: 'Build',
    );

    print(green('start build application in directory $pwd'));
    await step.run();
  }
}
