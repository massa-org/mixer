// ignore_for_file: lines_longer_than_80_chars

import 'dart:async';
import 'dart:io';

import 'package:dcli/dcli.dart';
import 'package:path/path.dart';

import 'secrets_provider.dart';
import 'secrets_tmp_dir_mixin.dart';

class TestingSecretsProvider extends SecretsProvider
    with SecretsProviderTmpDirMixin {
  static String providerName = 'testing';

  @override
  FutureOr<File> getGoogleServiceKey() {
    throw Exception(
      "GoogleServiceKey secret is not supported for 'testing' secret strategy",
    );
  }

  @override
  FutureOr<File> getKeyJks() {
    final keyFile = join(secretsTmpDir, 'key.jks');
    "rm -f '$keyFile'".run;
    const keytoolAns = '''
tmp_pass
tmp_pass






yes

''';

    ("echo '$keytoolAns'" |
            "keytool -genkey -v -keystore '$keyFile' -keyalg RSA -keysize 2048 -validity 10000 -alias key")
        .run;
    return File(keyFile);
  }

  @override
  FutureOr<File> getKeyProperty() async {
    const content = '''
storePassword=tmp_pass
keyPassword=tmp_pass
keyAlias=key
storeFile=../../build/key.jks
''';
    final keyFile = join(secretsTmpDir, 'key.property');
    final file = File(keyFile);
    await file.writeAsString(content);
    return file;
  }
}
