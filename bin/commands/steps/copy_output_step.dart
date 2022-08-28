import 'dart:io';

import 'package:riverpod/riverpod.dart';

import '../../ref.dart';
import 'build_step.dart';

final outputFileProvider = StateProvider<String?>((_) => null);

class CopyOutputStep extends BuildStep {
  @override
  Future<void> run() async {
    await super.run();
    final output = ref.read(outputFileProvider);
    if (output?.endsWith('apk') == true) {
      File('./build/app/outputs/apk/release/app-release.apk').copySync(output!);
    }
    if (output?.endsWith('aab') == true) {
      File('./build/app/outputs/bundle/release/app-release.aab')
          .copySync(output!);
    }
  }

  @override
  String get summary => 'copy build result';
}
