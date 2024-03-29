import 'package:args/args.dart';
import 'package:riverpod/riverpod.dart';

import '../ref.dart';
import 'steps/copy_output_step.dart';

final buildApkProvider = StateProvider((_) => false);
final buildAabProvider = StateProvider((_) => false);

void setAndroidBuildConfiguration(ArgResults? argResults) {
  final output = argResults?['output'] as String?;
  ref.read(outputFileProvider.notifier).update((state) => output ?? state);

  final outputDirectory = argResults?['output-directory'] as String?;
  ref
      .read(outputDirectoryProvider.notifier)
      .update((state) => outputDirectory ?? state);

  if (output?.endsWith('apk') ?? false) {
    ref.read(buildApkProvider.notifier).update((_) => true);
  }
  if (output?.endsWith('aab') ?? false) {
    ref.read(buildAabProvider.notifier).update((_) => true);
  }

  ref
      .read(buildAabProvider.notifier)
      .update((state) => (argResults?['aab'] as bool?) ?? state);

  ref
      .read(buildApkProvider.notifier)
      .update((state) => (argResults?['apk'] as bool?) ?? state);
}
