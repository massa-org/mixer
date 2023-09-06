// ignore_for_file: always_put_control_body_on_new_line

import 'package:args/args.dart';
import 'package:path/path.dart';

import '../fvm/detect_fvm.dart';
import '../fvm/fvm_provider.dart';
import '../interactive/interactive_provider.dart';
import '../interactive/select_target.dart';
import '../ref.dart';
import '../secrets_provider/secrets_provider.dart';
import '../secrets_provider/secrets_repository_provider.dart';
import '../version/version_provider.dart';
import 'android_build_configuration.dart';

ArgParser getDefaultArgParser() => ArgParser()
  ..addOption(
    'deploy',
    help: 'deploy strategy',
    allowed: ['none', 'internal', 'beta', 'release'],
    defaultsTo: 'none',
  )
  ..addOption(
    'secrets',
    help: 'secrets provider for build',
    allowed: [
      'git',
      'env',
      'testing',
      'dev',
    ],
    defaultsTo: 'git',
  )
  ..addOption(
    'secretRepository',
    help: 'ssh link to repository with application secrets',
  )
  ..addOption(
    'version',
    help: 'override application version in format v0.0.0+0',
  )
  ..addOption(
    'output',
    abbr: 'o',
    help: 'output file',
  )
  ..addOption(
    'output-directory',
    abbr: 'd',
    help: 'directory for copy all flavors',
  )
  ..addFlag(
    'use-fvm',
    help: 'use `fvm flutter` instead of `flutter` command',
    defaultsTo: null,
  )
  ..addFlag(
    'apk',
    help: 'force build apk file',
    negatable: false,
    defaultsTo: null,
  )
  ..addFlag(
    'aab',
    help: 'force build aab file',
    negatable: false,
    defaultsTo: null,
  )
  ..addFlag(
    'ci',
    help: 'disable all user interactions',
    negatable: false,
  );

// must be call after set arguments
Future<void> checkBuildTargets() async {
  final hasBuildTarget =
      ref.read(buildApkProvider) || ref.read(buildAabProvider);

  if (hasBuildTarget) return;
  final userSelectedTarget = interactiveSelectBuildTarget();

  switch (userSelectedTarget) {
    case BuildTarget.apk:
      ref.read(buildApkProvider.notifier).update((_) => true);
      break;
    case BuildTarget.aab:
      ref.read(buildAabProvider.notifier).update((_) => true);
      break;
    case null:
      throw Exception(
        'nothing to build, target is not selected pass --apk or --aab option',
      );
  }
  await Future.microtask(() => null);
}

Future<void> setArguments(ArgResults? argResults) async {
  ref
      .read(secretsRepositoryProvider.notifier)
      .update((_) => getSecretRepository(argResults));

  final secrets = argResults?['secrets'] as String?;
  if (secrets != null) {
    ref.read(selectedSecretsProvider.notifier).update((_) => secrets);
  }

  ref
      .read(interactiveProvider.notifier)
      .update((_) => getInteractive(argResults));
  ref.read(versionProvider.notifier).update((_) => getVersion(argResults));
  ref.read(useFvmProvider.notifier).update((_) => getUseFvm(argResults));

  setAndroidBuildConfiguration(argResults);

  await Future.microtask(() => null);
}

String? getFlavor(ArgResults? argResults) {
  final flavor = argResults?['flavor'] as String?;
  return flavor != null ? basename(flavor) : null;
}
