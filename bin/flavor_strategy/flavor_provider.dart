import 'dart:async';
import 'dart:io';

import 'package:riverpod/riverpod.dart';

import '../mixer_config/mixer_config.provider.dart';
import 'flavor_config.dart';
import 'strategies/flat_flavor_strategy.dart';
import 'strategies/flavorful_flavor_strategy.dart';
import 'strategies/spicy_flavor_strategy.dart';

class ApplicationFlavor {
  ApplicationFlavor({
    required this.flavorId,
    required this.config,
    this.flavorOverrides,
  });

  final String flavorId;
  final FlavorConfigModel config;
  final Directory? flavorOverrides;

  @override
  String toString() =>
      // ignore: lines_longer_than_80_chars
      'ApplicationFlavor(flavorId: $flavorId, config: $config,flavorOverrides: ${flavorOverrides?.path})';
}

// what is flavor?
//  set of file overrides and config context
abstract class FlavorStrategy {
  FutureOr<void> init() {}
  FutureOr<void> dispose() {}

  FutureOr<List<ApplicationFlavor>> getFlavorList();

  FutureOr<ApplicationFlavor> getFallbackFlavor();
  FutureOr<ApplicationFlavor?> getFlavor(String flavorId);
}

final flavorStrategyProvider = FutureProvider((ref) async {
  final strategy = ref.watch(mixerConfigProvider).map(
        flat: (_) => FlatFlavorStrategy(),
        flavorful: (_) => FlavorfullFlavorStrategy(),
        spicy: (_) => SpicyFlavorStrategy(),
      );

  await strategy.init();
  return strategy;
});

final flavorProvider = StateProvider<AsyncValue<ApplicationFlavor>>(
  (_) => const AsyncLoading(),
);
