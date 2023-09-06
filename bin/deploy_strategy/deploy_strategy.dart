// ignore_for_file: one_member_abstracts

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
