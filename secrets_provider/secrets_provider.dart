import 'dart:async';
import 'dart:io';

import 'package:riverpod/riverpod.dart';

import 'testing_secret_provider.dart';

abstract class SecretsProvider {
  FutureOr<File> getKeyJks();
  FutureOr<File> getKeyProperty();
  FutureOr<File> getGoogleServiceKey();

  FutureOr<void> init() {}
  FutureOr<void> dispose() {}
}

final secretsProvider = FutureProvider<SecretsProvider>(
  (ref) async {
    final provider = TestingSecretsProvider();
    ref.onDispose(provider.dispose);
    await provider.init();
    return provider;
  },
);
