import 'package:args/args.dart';

import '../ref.dart';
import '../secrets_provider/secrets_provider.dart';
import '../secrets_provider/secrets_repository_provider.dart';
import '../version/version_provider.dart';

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
    allowed: ['git', 'env', 'testing'],
    defaultsTo: 'git',
  )
  ..addOption(
    'secretsRepository',
    help: 'ssh link to repository with application secrets',
  );

Future<void> setArguments(ArgResults? argResults) async {
  ref
      .read(secretsRepositoryProvider.notifier)
      .update((_) => getSecretRepository(argResults));
  final secrets = argResults?['secrets'] as String?;
  if (secrets != null) {
    ref.read(selectedSecretsProvider.notifier).update((_) => secrets);
  }

  ref.read(versionProvider.notifier).update((_) => getVersion(argResults));

  await Future.microtask(() => null);
}
