import 'build_step.dart';

// detect and run 'code' generators after flavor overrides files
// plugins that must be detected:
//   flutter_native_splash, icons_launcher, the_splash
class PrebuildStep extends BuildStep {
  @override
  Future<void> run() async {
    await super.run();
    throw UnimplementedError('$runtimeType unimplemented yet');
  }

  @override
  String get summary =>
      'generate plugin files based on overrides (splash,icons,etc)';
}
