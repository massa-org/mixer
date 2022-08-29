import 'dart:io';

import 'package:dcli/dcli.dart';
import 'package:riverpod/riverpod.dart';

import '../../flavor_strategy/flavor_provider.dart';
import '../../mixer_config/mixer_config.provider.dart';
import '../../ref.dart';
import '../android_build_configuration.dart';
import 'build_step.dart';

final outputFileProvider = StateProvider<String?>((_) => null);
final outputDirectoryProvider = StateProvider<String?>((_) => null);

class CopyOutputStep extends BuildStep {
  @override
  Future<void> run() async {
    await super.run();
    final output = ref.read(outputFileProvider);
    final outputDirectory = ref.read(outputDirectoryProvider);

    final isSingleFlavor = ref
        .read(mixerConfigProvider)
        .maybeWhen(flat: () => true, orElse: () => false);
    final activeFlavor = await ref.read(flavorProvider.future);

    if (output == null && outputDirectory == null) {
      return;
    }

    if (output != null && !isSingleFlavor) {
      throw Exception(
        'Output option `-o` can be specified only for flat projects',
      );
    }

    final appId = activeFlavor.config.applicationId;
    final file = output ?? appId.split('.').reversed.take(2).join('.');
    final result = file.endsWith('.apk') || file.endsWith('.aab')
        ? file.substring(0, file.length - 4)
        : file;
    print(red(outputDirectory.toString()));
    if (outputDirectory != null) {
      Directory(outputDirectory).createSync(recursive: true);
    }

    if (ref.read(buildApkProvider)) {
      File('./build/app/outputs/apk/release/app-release.apk')
          .copySync(join(outputDirectory ?? '', '$result.apk'));
    }
    if (ref.read(buildAabProvider)) {
      File('./build/app/outputs/bundle/release/app-release.aab')
          .copySync(join(outputDirectory ?? '', '$result.aab'));
    }
  }

  @override
  String get summary => 'copy build result';
}
