import 'dart:io';

import 'package:dcli/dcli.dart';

bool detectFvm() {
  if (File('.fvm/fvm_config.json').existsSync()) {
    print(
      yellow(
        '.fvm/fvm_config.json configuration was been detected, use fvm for build',
      ),
    );
    return true;
  }
  return false;
}

bool getUseFvm(ArgResults? argResults) =>
    (argResults?['use-fvm'] as bool?) ?? detectFvm();
