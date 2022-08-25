import 'dart:async';
import 'dart:io';

import 'package:riverpod/riverpod.dart';

import '../flavor_strategy/flavor_provider.dart';
import 'env_secrets_provider.dart';
import 'git_secrets_provider.dart';
import 'testing_secret_provider.dart';

abstract class SecretsProvider {
  FutureOr<File> getKeyJks();
  FutureOr<File> getKeyProperty();
  FutureOr<File> getGoogleServiceKey();

  FutureOr<void> init() {}
  FutureOr<void> dispose() {}
}

final secretsProvidersMap = <String, FutureOr<SecretsProvider> Function(Ref)>{
  GitSecretsProvider.providerName: (ref) async => ref
      .watch(flavorProvider.future)
      .then((value) => GitSecretsProvider(value.config.applicationId)),
  TestingSecretsProvider.providerName: (_) => TestingSecretsProvider(),
  EnvSecretsProvider.providerName: (_) => EnvSecretsProvider(),
};

final selectedSecretsProvider = StateProvider((_) => 'git');

final secretsProvider = FutureProvider<SecretsProvider>(
  (ref) async {
    final providerFn = secretsProvidersMap[ref.watch(selectedSecretsProvider)];
    final provider = await providerFn!.call(ref);

    ref.onDispose(provider.dispose);
    await provider.init();
    return provider;
  },
);
