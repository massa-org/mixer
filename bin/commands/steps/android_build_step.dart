import 'package:dcli/dcli.dart';

import 'build_step.dart';

class AndroidAppbundleBuildStep extends BuildStep {
  @override
  Future<void> run() async {
    await super.run();

    'flutter build appbundle'.start(progress: Progress.print());
  }

  @override
  String get summary => 'build android appbundle';
}

class AndroidApkBuildStep extends BuildStep {
  @override
  Future<void> run() async {
    await super.run();

    'flutter build apk'.start(progress: Progress.print());
  }

  @override
  String get summary => 'build android application in apk format';
}
