import 'package:args/args.dart';
import 'package:riverpod/riverpod.dart';

final interactiveProvider = StateProvider((ref) => true);

bool getInteractive(ArgResults? argResults) =>
    !((argResults?['ci'] as bool?) ?? false);
