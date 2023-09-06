import 'package:collection/collection.dart';
import 'package:dcli/dcli.dart';
import 'package:interact/interact.dart';

import '../flavor_strategy/flavor_provider.dart';
import '../ref.dart';
import 'interactive_provider.dart';

Future<ApplicationFlavor?> userInteractSelectFlavor() async {
  final interactive = ref.read(interactiveProvider);
  if (interactive == false) {
    return null;
  }

  final flavorStrategy = await ref.read(flavorStrategyProvider.future);
  final fallback = await flavorStrategy.getFallbackFlavor();
  final flavors = await flavorStrategy.getFlavorList();
  final allowedFlavors =
      flavors.whereNot((e) => e.flavorId == fallback.flavorId).toList();
  print(yellow('--flavor option is not set and project has multiple flavors'));
  final id = Select.withTheme(
    prompt: yellow('choose which flavor to use'),
    options: allowedFlavors.map((e) => e.flavorId).toList(),
    theme: Theme.basicTheme,
  ).interact();

  if (id < 0 || id >= allowedFlavors.length) {
    return null;
  }

  return allowedFlavors[id];
}
