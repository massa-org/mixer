import 'package:riverpod/riverpod.dart';

extension StateProviderFutureExtension<T> on StateProvider<AsyncValue<T>> {
  Provider<Future<T>> get future => Provider<Future<T>>(
        (ref) async {
          final notifier = ref.watch(this.notifier);
          if (notifier.state.hasValue) {
            return notifier.state.requireValue;
          }
          return notifier.stream
              .firstWhere((e) => e.hasValue)
              .then((value) => value.requireValue);
        },
      );
}
