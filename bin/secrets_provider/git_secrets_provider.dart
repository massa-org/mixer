import 'dart:async';
import 'dart:io';

import 'package:dcli/dcli.dart';
import 'package:path/path.dart';

import '../ref.dart';
import 'secrets_provider.dart';
import 'secrets_repository_provider.dart';

class GitSecretsProvider extends SecretsProvider {
  GitSecretsProvider(this.applicationId);

  static String providerName = 'git';

  final String applicationId;
  late String secretsDirectory = env['SECRETS_REPOSITORY_SUBDIR'] ?? 'keys';

  final _tmpKey = DateTime.now().millisecondsSinceEpoch.toString();
  late final secretsTmpDir = join('/tmp', 'mixer-secrets-$_tmpKey');

  @override
  FutureOr<void> init() {
    final repositoryLink = ref.read(secretsRepositoryProvider) ?? '';
    if (repositoryLink.isEmpty) {
      throw Exception(
        'secretsRepository is not provided, '
        'set args --secretRepository, '
        'or ENV variable SECRET_REPOSITORY',
      );
    }

    'git clone $repositoryLink $secretsTmpDir'.run;

    return super.init();
  }

  @override
  FutureOr<void> dispose() {
    final dir = Directory(secretsTmpDir);
    if (dir.existsSync()) {
      dir.deleteSync(recursive: true);
    }

    return super.dispose();
  }

  File _extractFile(String fileName) {
    final file = File(
      join(secretsTmpDir, secretsDirectory, applicationId, fileName),
    );

    if (!file.existsSync()) {
      throw Exception(
        '$fileName secret is not provider in git secrets repository\n'
        'expected to be file "$applicationId/$fileName" in repository',
      );
    }
    return file;
  }

  @override
  FutureOr<File> getGoogleServiceKey() =>
      _extractFile('google_service_key.json');

  @override
  FutureOr<File> getKeyJks() => _extractFile('key.jks');

  @override
  FutureOr<File> getKeyProperty() => _extractFile('key.properties');
}
