import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dcli/dcli.dart';

import 'secrets_provider.dart';
import 'secrets_tmp_dir_mixin.dart';

class EnvSecretsProvider extends SecretsProvider
    with SecretsProviderTmpDirMixin {
  static String providerName = 'env';

  final keyJksKey = 'UPLOAD_KEY';
  final keyPropertiesKey = 'UPLOAD_KEY_PROPERTIES';
  final serviceKeyKey = 'GOOGLE_SERVICE_KEY';

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
