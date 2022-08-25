import 'package:riverpod/riverpod.dart';

import 'mixer_config.dart';

final mixerConfigProvider = StateProvider((_) => const MixerConfig.flat());
