import 'dart:async';

import 'deploy_strategy.dart';

class BetaDeployStrategy extends DeployStrategy {
  @override
  FutureOr<void> deploy() {
    throw UnimplementedError("BetaDeployStrategy is't implemented");
  }
}
