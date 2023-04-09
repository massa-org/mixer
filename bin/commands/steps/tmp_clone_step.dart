import 'dart:io';

import 'package:dcli/dcli.dart';
import 'package:riverpod/riverpod.dart';

import '../../build_directory.dart';
import '../../ref.dart';
import 'build_step.dart';

final _buildTmpDir = StateProvider<String?>((ref) {
  ref.onDispose(() {
    final dir = ref.controller.state;

    if (dir == null) {
      return;
    }

    Directory(dir).deleteSync(recursive: true);
  });
  return null;
});

class TmpCloneStep extends BuildStep {
  TmpCloneStep();

  static List<TmpCloneStep> fromArg(ArgResults? argResults) {
    if ((argResults?['clone'] as bool?) == true) {
      return [TmpCloneStep()];
    }

    return [];
  }

  @override
  Future<void> run() async {
    await super.run();
    final tmpDir =
        '/tmp/mixer-build-dir-${DateTime.now().millisecondsSinceEpoch}';

    ref.read(_buildTmpDir.notifier).update((state) => tmpDir);

    'git clone ${ref.read(buildDirectoryProvider)} $tmpDir'
        .start(progress: Progress.print());

    ref.read(buildDirectoryProvider.notifier).update((_) => tmpDir);
    await Future.microtask(() => null);
  }

  @override
  String get summary => 'clone repository to /tmp';
}
