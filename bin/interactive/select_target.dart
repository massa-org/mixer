import 'package:dcli/dcli.dart';
import 'package:interact/interact.dart';

import '../ref.dart';
import 'interactive_provider.dart';

enum BuildTarget {
  apk,
  aab,
}

BuildTarget? interactiveSelectBuildTarget() {
  final isInteractive = ref.read(interactiveProvider);
  if (!isInteractive) {
    return null;
  }

  print(yellow('build target is not set, --apk, --aab options is not passed'));
  final id = Select.withTheme(
    prompt: yellow('choose which build target to use'),
    options: ['apk', 'aab'],
    theme: Theme.basicTheme,
  ).interact();

  return BuildTarget.values[id];
}
