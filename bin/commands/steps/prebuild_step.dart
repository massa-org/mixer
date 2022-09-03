import 'package:dcli/dcli.dart';

import '../../fvm/fvm_provider.dart';
import '../../ref.dart';
import 'build_step.dart';

// detect and run 'code' generators after flavor overrides files
// plugins that must be detected:
//   flutter_native_splash, icons_launcher, the_splash
class PrebuildStep extends BuildStep {
  @override
  Future<void> run() async {
    await super.run();
    final flutterExec = ref.read(useFvmProvider) ? 'fvm flutter' : 'flutter';

    '$flutterExec pub get'.start(progress: Progress.print());
    '$flutterExec pub run build_runner build --delete-conflicting-outputs'
        .start(progress: Progress.print());
    '$flutterExec pub run icons_launcher:create'
        .start(progress: Progress.print());
    '$flutterExec pub run the_splash'.start(progress: Progress.print());
  }

  @override
  String get summary =>
      'generate plugin files based on overrides (splash,icons,etc)';
}
