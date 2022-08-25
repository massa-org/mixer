import 'package:dcli/dcli.dart';

import 'build_step.dart';

class CleanAfterBuildStep extends BuildStep {
  @override
  Future<void> run() async {
    await super.run();
    'git checkout .'.start(progress: Progress.print());
    'git clean -fd'.start(progress: Progress.print());
  }

  @override
  String get summary => 'clean project directory after build';
}
