import 'dart:io';

import 'build_step.dart';

class PrepareProjectDirectoryStep extends BuildStep {
  @override
  Future<void> run() async {
    await super.run();

    Directory('./build').createSync();
  }

  @override
  String get summary => 'create directory structure';
}
