import 'dart:io';

import 'package:dcli/dcli.dart';

import '../../mixer_config/mixer_config.dart';
import '../../mixer_config/mixer_config.provider.dart';
import '../../ref.dart';
import '../../utils/decode_yaml.dart';
import 'build_step.dart';

// read mixer configuration from project folder
class ConfigureMixerStep extends BuildStep {
  @override
  Future<void> run() async {
    await super.run();
    final mixerConfig = File(join(pwd, 'mixer_config.yaml'));
    var config = const MixerConfig.flat();
    if (mixerConfig.existsSync()) {
      config = MixerConfig.fromJson(
        decodeYaml(mixerConfig.readAsStringSync()),
      );
      ref.read(mixerConfigProvider.notifier).update((_) => config);
      print('apply config `$config`');
    } else {
      print(
        orange(
          'file ${mixerConfig.path} directory use `$config`'
          ' for build',
        ),
      );
    }
    // await riverpod update
    await Future.microtask(() => null);
  }

  @override
  String get summary => 'configure build system';
}
