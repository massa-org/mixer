import 'package:dcli/dcli.dart';

import 'build_step.dart';

class GitCheckStep extends BuildStep {
  @override
  Future<void> run() async {
    await super.run();
    final result = 'git status --porcelain'.toList().join();
    if (result.isNotEmpty) {
      throw Exception(
        'project has uncommited changes, commit it or stash before build',
      );
    }
  }

  @override
  String get summary => 'check project has uncommited changes';
}
