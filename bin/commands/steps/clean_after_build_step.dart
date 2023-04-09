import 'package:dcli/dcli.dart';

import '../../build_directory.dart';
import '../../ref.dart';
import 'build_step.dart';

class CleanAfterBuildStep extends BuildStep {
  @override
  Future<void> run() async {
    await super.run();
    'git checkout .'.start(
      progress: Progress.print(),
      workingDirectory: ref.read(buildDirectoryProvider),
    );
    'git clean -fd'.start(
      progress: Progress.print(),
      workingDirectory: ref.read(buildDirectoryProvider),
    );
  }

  @override
  String get summary => 'clean project directory after build';
}
