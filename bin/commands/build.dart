import 'dart:async';
import 'dart:io';

import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:dcli/dcli.dart';

import '../ref.dart';
import '../secrets_provider/secrets_provider.dart';
import 'steps/android_sign_step.dart';
import 'steps/apply_flavor_step.dart';
import 'steps/configure_flavor_step.dart';
import 'steps/mixer_configuration_step.dart';

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
    final steps = [
      ConfigureMixerStep(),
      ConfigureFlavorStep(userSelectedFlavor: argResults?['flavor'] as String?),
      ApplyFlavorOverridesStep(),
      AndroidSignStep(),
    ];

    print(green('start build application in directory $pwd'));
    var currentStep = 1;
    for (final v in steps) {
      print(
        green(
          '\n\n($currentStep/${steps.length}): ${v.runtimeType} ${v.summary}',
        ),
      );
      await v.run();
      currentStep += 1;
    }

    // final secret = argResults?['secrets'] as String?;
    // ref.read(selectedSecretsProvider.notifier).update((v) => secret ?? v);
    // await Future.microtask(() {});

    // print(green('# fetch secrets and sign'));
    // final secrets = await ref.read(secretsProvider.future);
    // final keyProperties = await secrets.getKeyProperty();
    // final keyJks = await secrets.getKeyJks();

    // keyJks.copySync('./build/key.jks');
    // File('./android/key.properties').writeAsStringSync(
    //   keyProperties
    //       .readAsLinesSync()
    //       .map((e) =>
    //           e.startsWith('storeFile') ? 'storeFile=../../build/key.jks' : e)
    //       .join('\n'),
    // );
    // final flutterCommand = 'flutter';

    // print(green('# prebuild'));
    // '$flutterCommand pub get'.start(progress: Progress.print());
    // '$flutterCommand pub run build_runner build --delete-conflicting-outputs'
    //     .start(progress: Progress.print());
    // '$flutterCommand pub run icons_launcher:create'
    //     .start(progress: Progress.print());
    // '$flutterCommand pub run the_splash'.start(progress: Progress.print());

    // print(green('# replace flavors params'));

    // './tool/build.sh'.start(progress: Progress.print());
  }
}
