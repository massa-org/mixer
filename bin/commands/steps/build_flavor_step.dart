import 'package:riverpod/riverpod.dart';

import '../../flavor_strategy/flavor_provider.dart';
import '../../ref.dart';
import 'android_build_step.dart';
import 'android_google_fastlane_deploy_step.dart';
import 'android_sign_step.dart';
import 'apply_flavor_overrides_step.dart';
import 'build_step.dart';
import 'clean_after_build_step.dart';
import 'configure_flavor_step.dart';
import 'configure_secrets_step.dart';
import 'prebuild_step.dart';
import 'substep_step.dart';

BuildStep buildFlavorStep(String? flavorId) {
  final name = flavorId ?? 'fallback';
  return SubstepStep(
    [
      ConfigureFlavorStep(userSelectedFlavor: flavorId),
      ConfigureSecretsStep(),

      // configure project before build
      ApplyFlavorOverridesStep(),
      PrebuildStep(),

      // build
      SubstepStep(
        [
          AndroidSignStep(),
          AndroidAppbundleBuildStep(),
          AndroidGoogleFastlaneDeployStep()
        ],
        name: 'AndroidBuild',
      ),
      CleanAfterBuildStep(),
    ],
    name: 'BuildFlavor${name[0].toUpperCase()}${name.substring(1)}',
  );
}

class BuildAllFlavorStep extends BuildStep {
  BuildAllFlavorStep();

  @override
  Future<void> run() async {
    await super.run();

    final flavorStrategy = await ref.read(flavorStrategyProvider.future);

    final flavors = await flavorStrategy.getFlavorList();
    final fallback = await flavorStrategy.getFallbackFlavor();

    await SubstepStep(
      flavors
          .where((e) => e.flavorId != fallback.flavorId)
          .map((e) => buildFlavorStep(e.flavorId))
          .toList(),
      name: 'FullBuild',
    ).run();
  }

  @override
  String get summary => 'build all flavors in once';
}
