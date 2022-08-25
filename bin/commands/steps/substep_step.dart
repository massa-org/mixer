// ignore_for_file: no_runtimetype_tostring

import 'build_step.dart';

class SubstepStep extends BuildStep {
  SubstepStep(this.steps, {this.name});

  final List<BuildStep> steps;
  final String? name;

  @override
  // ignore: must_call_super
  Future<void> run() async {
    var currentStep = 1;
    for (final v in steps) {
      BuildStep.execContext.add('$name ($currentStep/${steps.length})');
      await v.run();
      currentStep += 1;
      BuildStep.execContext.removeLast();
    }
  }

  @override
  String get summary => '';
}
