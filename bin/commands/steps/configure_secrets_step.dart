import '../../ref.dart';
import '../../secrets_provider/secrets_provider.dart';
import 'build_step.dart';

class ConfigureSecretsStep extends BuildStep {
  ConfigureSecretsStep({this.secretProvider});
  final String? secretProvider;

  @override
  Future<void> run() async {
    await super.run();
    if (secretProvider != null) {
      ref.read(selectedSecretsProvider.notifier).update((_) => secretProvider!);
      // await riverpod update
      await Future.microtask(() => null);
    }
  }

  @override
  String get summary => 'initialize secrets provider';
}
