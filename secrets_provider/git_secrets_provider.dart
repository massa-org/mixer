import 'dart:io';

import 'dart:async';

import 'package:dcli/dcli.dart';

import 'secrets_provider.dart';

class GitSecretsProvider extends SecretsProvider {
  final String secretsSubDirectory;

  final _tmpKey = DateTime.now().millisecondsSinceEpoch.toString();
  late final secretsTmpDir = join("/tmp", 'mixer-secrets-$_tmpKey');

  GitSecretsProvider(this.secretsSubDirectory);

  @override
  FutureOr<void> init() {
    const envKey = 'SECRETS_REPOSITORY';
    final repositoryLink = env[envKey] ?? '';
    if (repositoryLink.isEmpty) {
      throw Exception(
        'ENV variable "$envKey" with link to git with secrets repository does\'t provided',
      );
    }

    'git clone $repositoryLink $secretsTmpDir'.run;

    return super.init();
  }

  @override
  FutureOr<void> dispose() {
    Directory(secretsTmpDir).deleteSync(recursive: true);
    return super.dispose();
  }

  File _extractFile(String fileName) {
    final file = File(join(secretsTmpDir, secretsSubDirectory, fileName));

    if (!file.existsSync()) {
      throw Exception(
        '$fileName secret is not provider in git secrets repository\n'
        'expected to be file "$secretsSubDirectory/$fileName" in repository',
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
