import 'dart:async';
import 'dart:io';

import 'package:dcli/dcli.dart';

import '../flavor_config.dart';
import '../flavor_provider.dart';

class FlatFlavorStrategy extends FlavorStrategy {
  FlavorConfigModel loadConfig() =>
      loadFlavorConfig(File(join(pwd, 'flavor_config.yaml')));

  @override
  FutureOr<ApplicationFlavor> getFallbackFlavor() => ApplicationFlavor(
        flavorId: 'flat',
        config: loadConfig(),
      );

  @override
  FutureOr<ApplicationFlavor?> getFlavor(String flavorId) {
    if (flavorId == 'flat') {
      return getFallbackFlavor();
    }
    return null;
  }

  @override
  FutureOr<List<ApplicationFlavor>> getFlavorList() async =>
      [await getFallbackFlavor()];
}
