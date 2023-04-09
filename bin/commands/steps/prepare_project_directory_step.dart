import 'dart:io';

import 'package:dcli/dcli.dart';

import '../../build_directory.dart';
import '../../ref.dart';
import 'build_step.dart';

class PrepareProjectDirectoryStep extends BuildStep {
  @override
  Future<void> run() async {
    await super.run();

    Directory(join(ref.read(buildDirectoryProvider), './build')).createSync();
  }

  @override
  String get summary => 'create directory structure';
}
