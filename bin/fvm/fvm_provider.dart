import 'package:riverpod/riverpod.dart';

final useFvmProvider = StateProvider((_) => false);

// flutter command to provider allow to rewrite it
final flutterExecProvider = Provider(
  (ref) => ref.watch(useFvmProvider) ? 'fvm flutter' : 'flutter',
);
