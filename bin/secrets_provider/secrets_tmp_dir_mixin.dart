import 'dart:async';
import 'dart:io';

import 'package:dcli/dcli.dart';

import 'secrets_provider.dart';

// create and manage tmp directory for keys store
mixin SecretsProviderTmpDirMixin on SecretsProvider {
  final String _tmpKey = DateTime.now().millisecondsSinceEpoch.toString();
  late final secretsTmpDir = join('/tmp', 'mixer-secrets-$_tmpKey');

  @override
  FutureOr<void> init() {
    Directory(secretsTmpDir).createSync();
    return super.init();
  }

  @override
  FutureOr<void> dispose() {
    Directory(secretsTmpDir).deleteSync(recursive: true);
    return super.dispose();
  }
}
