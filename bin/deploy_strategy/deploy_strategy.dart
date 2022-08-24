import 'dart:async';

import 'package:riverpod/riverpod.dart';

abstract class DeployStrategy {
  FutureOr<void> deploy();
}

class NoneDeployStrategy extends DeployStrategy {
  @override
  FutureOr<void> deploy() {}
}

final deployStrategyProvider = StateProvider<DeployStrategy>(
  (_) => NoneDeployStrategy(),
);
