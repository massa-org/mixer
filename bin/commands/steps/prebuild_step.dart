import 'package:dcli/dcli.dart';
import 'package:riverpod/riverpod.dart';

import '../../flavor_strategy/flavor_provider.dart';
import '../../ref.dart';
import '../../version/version_provider.dart';
import 'build_step.dart';

// detect and run 'code' generators after flavor overrides files
// plugins that must be detected:
//   flutter_native_splash, icons_launcher, the_splash
class PrebuildStep extends BuildStep {
  @override
  Future<void> run() async {
    await super.run();
    'flutter pub get'.start(progress: Progress.print());
    'flutter pub run build_runner build --delete-conflicting-outputs'
        .start(progress: Progress.print());
    'flutter pub run icons_launcher:create'.start(progress: Progress.print());
    'flutter pub run the_splash'.start(progress: Progress.print());

    final version = ref.read(versionProvider);
    final flavor = (await ref.read(flavorProvider.future)).config;

    "./tool/replace_params.dart $version '${flavor.applicationId}' '${flavor.applicationName}' '${flavor.deepLinkHost}'"
        .start(progress: Progress.print());
  }

  @override
  String get summary =>
      'generate plugin files based on overrides (splash,icons,etc)';
}
