import 'dart:async';

import 'deploy_strategy.dart';

class ReleaseDeployStrategy extends DeployStrategy {
  @override
  FutureOr<void> deploy() {
    throw UnimplementedError("ReleaseDeployStrategy is't implemented");
  }
}
