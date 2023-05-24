import 'package:dcli/dcli.dart';

import '../../build_directory.dart';
import '../../fvm/fvm_provider.dart';
import '../../ref.dart';
import 'build_step.dart';

class AndroidAppbundleBuildStep extends BuildStep {
  @override
  Future<void> run() async {
    await super.run();
    final flutterExec = ref.read(flutterExecProvider);

    '$flutterExec build appbundle'.start(
      progress: Progress.print(),
      workingDirectory: ref.read(buildDirectoryProvider),
    );
  }

  @override
  String get summary => 'build android appbundle';
}

class AndroidApkBuildStep extends BuildStep {
  @override
  Future<void> run() async {
    await super.run();
    final flutterExec = ref.read(flutterExecProvider);

    '$flutterExec build apk'.start(
      progress: Progress.print(),
      workingDirectory: ref.read(buildDirectoryProvider),
    );
  }

  @override
  String get summary => 'build android application in apk format';
}
