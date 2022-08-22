import 'dart:async';

import 'deploy_strategy.dart';

class InternalDeployStrategy extends DeployStrategy {
  @override
  FutureOr<void> deploy() {
    throw UnimplementedError("internal deploy strategy is't implemented");
  }
}
