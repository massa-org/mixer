import 'package:riverpod/riverpod.dart';

import '../../flavor_strategy/flavor_provider.dart';
import '../../mixer_config/mixer_config.provider.dart';
import '../../ref.dart';
import 'build_step.dart';

// get user selected flavor and get it data with use of FlavorStrategy
class ConfigureFlavorStep extends BuildStep {
  ConfigureFlavorStep({this.userSelectedFlavor});

  final String? userSelectedFlavor;

  @override
  Future<void> run() async {
    await super.run();
    final flavorStrategy = await ref.read(flavorStrategyProvider.future);
    ApplicationFlavor flavor;
    if (userSelectedFlavor != null) {
      final _flavor = await flavorStrategy.getFlavor(userSelectedFlavor!);
      if (_flavor == null) {
        final flavors = await flavorStrategy.getFlavorList();
        throw Exception(
          'Selected flavor ($userSelectedFlavor) is not supported\n'
          'list of supported flavors: '
          '(${flavors.map((e) => e.flavorId).join(' , ')})',
        );
      }
      flavor = _flavor;
    } else {
      final mixerConfig = ref.read(mixerConfigProvider);
      if (mixerConfig.maybeMap(flat: (_) => false, orElse: () => true)) {
        throw Exception('flavor is not selected and project type is not flat');
      }
      flavor = await flavorStrategy.getFallbackFlavor();
    }

    ref.read(flavorProvider.notifier).update((_) => AsyncData(flavor));
    await Future.microtask(() => null);
  }

  @override
  String get summary => 'get and choose flavor to build';
}
