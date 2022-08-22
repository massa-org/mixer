import 'dart:convert';
import 'dart:io';

import 'dart:async';

import 'package:dcli/dcli.dart';
import 'package:riverpod/riverpod.dart';

import 'git_secrets_provider.dart';
import 'secrets_provider.dart';
import 'secrets_tmp_dir_mixin.dart';

class EnvSecretsProvider extends SecretsProvider
    with SecretsProviderTmpDirMixin {
  final keyJksKey = "UPLOAD_KEY";
  final keyPropertiesKey = "UPLOAD_KEY_PROPERTIES";
  final serviceKeyKey = "GOOGLE_SERVICE_KEY";

  File _extractFile(
    String fileName,
    String envKey,
  ) {
    final envContent = env[envKey];
    if ((envContent ?? '').isEmpty) {
      throw Exception(
        '$fileName secret is not provided as ENV variable\n'
        'expected to be base64 file content in "$serviceKeyKey" var',
      );
    }
    return File(join(secretsTmpDir, fileName))
      ..writeAsBytesSync(base64Decode(envContent!));
  }

  @override
  FutureOr<File> getGoogleServiceKey() =>
      _extractFile('google_service_key.json', serviceKeyKey);

  @override
  FutureOr<File> getKeyJks() => _extractFile('key.jks', keyJksKey);

  @override
  FutureOr<File> getKeyProperty() =>
      _extractFile('key.properties', keyPropertiesKey);
}

final secretsStrategyMapProvider = StateProvider(
  (_) => {
    'env': (ref) => EnvSecretsProvider(),
    'git': (ref) =>
        GitSecretsProvider(ref.watch(applicationFlavor).applicationid),
  },
);
