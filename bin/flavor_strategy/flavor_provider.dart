import 'dart:async';
import 'dart:io';

import 'package:riverpod/riverpod.dart';

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

final flavorProvider = FutureProvider(
  (_) => ApplicationFlavor(
    flavorId: 'id',
    applicationId: 'com.aldardigital.kizhingataxi.passenger',
    applicationName: 'name',
    deeplinkHost: 'host',
  ),
);
