import 'dart:async';
import 'dart:io';

class ApplicationFlavor {
  ApplicationFlavor({
    required this.flavorId,
    required this.applicationId,
    required this.applicationName,
    required this.deeplinkHost,
    this.flavorOverrides,
  });

  final String flavorId;
  final String applicationId;
  final String applicationName;
  final String deeplinkHost;

  final Directory? flavorOverrides;
}

// what is flavor?
//  set of file overrides and config context
abstract class FlavorStrategy {
  FutureOr<void> init();
  FutureOr<void> dispose();

  FutureOr<List<ApplicationFlavor>> getFlavorList();

  FutureOr<ApplicationFlavor> getFallbackFlavor();
  FutureOr<ApplicationFlavor?> getFlavor(String falvorId);
}

abstract class FlatFlavorStrategy extends FlavorStrategy {}

abstract class FlavorfullFlavorStrategy extends FlavorStrategy {}

abstract class SpicyFlavorStrategy extends FlavorStrategy {}
