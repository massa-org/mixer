import 'package:riverpod/riverpod.dart';

import '../../flavor_strategy/flavor_provider.dart';
import '../../interactive/select_flavor.dart';
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
    final mixerConfig = ref.read(mixerConfigProvider);

    ApplicationFlavor? flavor;
    if (userSelectedFlavor == null) {
      final isFlat = mixerConfig.maybeMap(
        flat: (_) => true,
        orElse: () => false,
      );
      if (isFlat) {
        flavor = await flavorStrategy.getFallbackFlavor();
      }
    } else {
      flavor = await flavorStrategy.getFlavor(userSelectedFlavor!);
    }

    flavor = flavor ?? await userInteractSelectFlavor();

    if (flavor == null) {
      final flavors = await flavorStrategy.getFlavorList();
      throw Exception(
        'Selected flavor ($userSelectedFlavor) is not supported\n'
        'list of supported flavors: '
        '(${flavors.map((e) => e.flavorId).join(' , ')})',
      );
    }

    ref.read(flavorProvider.notifier).update((_) => AsyncData(flavor!));
    await Future.microtask(() => null);
  }

  @override
  String get summary => 'get and choose flavor to build';
}
