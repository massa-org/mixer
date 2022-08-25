import 'dart:async';

import '../flavor_provider.dart';

class SpicyFlavorStrategy extends FlavorStrategy {
  @override
  FutureOr<ApplicationFlavor> getFallbackFlavor() {
    // TODO: implement getFallbackFlavor
    throw UnimplementedError('SpicyFlavorStrategy is not implemented yet');
  }

  @override
  FutureOr<ApplicationFlavor?> getFlavor(String flavorId) {
    // TODO: implement getFlavor
    throw UnimplementedError('SpicyFlavorStrategy is not implemented yet');
  }

  @override
  FutureOr<List<ApplicationFlavor>> getFlavorList() {
    // TODO: implement getFlavorList
    throw UnimplementedError('SpicyFlavorStrategy is not implemented yet');
  }
}
