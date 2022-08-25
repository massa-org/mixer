import 'dart:async';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:dcli/dcli.dart';

import '../../mixer_config/mixer_config.provider.dart';
import '../../ref.dart';
import '../flavor_config.dart';
import '../flavor_provider.dart';

class FlavorfullFlavorStrategy extends FlavorStrategy {
  late List<ApplicationFlavor> supportedFlavors;
  late ApplicationFlavor fallbackFlavor;

  @override
  FutureOr<void> init() {
    final config = ref.read(mixerConfigProvider).mapOrNull(flavorful: (v) => v);
    if (config == null) {
      throw Exception(
        'FlavorfullFlavorStrategy used with incorrect mixer config'
        ' ${ref.read(mixerConfigProvider)}',
      );
    }
    final dir = Directory(join(pwd, config.flavorsDirectory));

    supportedFlavors = dir
        .listSync()
        .whereType<Directory>()
        .map(
          (e) => ApplicationFlavor(
            flavorId: basename(e.path),
            config: loadFlavorConfig(
              File(join(e.path, 'flavor_config.yaml')),
            ),
            flavorOverrides: e,
          ),
        )
        .toList();

    final fallback = supportedFlavors
        .firstWhereOrNull((e) => e.flavorId == config.fallbackFlavor);

    if (fallback == null) {
      throw Exception(
        'FlavorfullFlavorStrategy fallback flavor (${config.fallbackFlavor}) '
        'directory is not exists',
      );
    }
    fallbackFlavor = fallback;
    return super.init();
  }

  @override
  ApplicationFlavor getFallbackFlavor() => fallbackFlavor;

  @override
  ApplicationFlavor? getFlavor(String flavorId) =>
      supportedFlavors.firstWhereOrNull((e) => e.flavorId == flavorId);

  @override
  List<ApplicationFlavor> getFlavorList() => supportedFlavors;
}
