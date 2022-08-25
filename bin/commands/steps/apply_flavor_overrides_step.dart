import 'dart:io';

import 'package:dcli/dcli.dart';
import 'package:riverpod/riverpod.dart';

import '../../flavor_strategy/flavor_provider.dart';
import '../../ref.dart';
import 'build_step.dart';

// rewrite files with overrides from fallback flavor than with selected flavor
class ApplyFlavorOverridesStep extends BuildStep {
  void copyOverrides(ApplicationFlavor flavor) {
    if (flavor.flavorOverrides != null) {
      final override = flavor.flavorOverrides!;
      if (!override.existsSync()) {
        throw Exception(
          'flavor ${flavor.flavorId} override directory'
          " '${override.path}'does't exists",
        );
      }
      // TODO rewrite to dart
      'cp -r ${flavor.flavorOverrides!.path}/* ./'
          .start(progress: Progress.print());
    }
  }

  @override
  Future<void> run() async {
    await super.run();

    final flavor = await ref.read(flavorProvider.future);
    final fallback = await (await ref.read(flavorStrategyProvider.future))
        .getFallbackFlavor();
    if (fallback.flavorId != flavor.flavorId) {
      copyOverrides(fallback);
    }
    copyOverrides(flavor);
  }

  @override
  String get summary => 'apply flavor overrides';
}
