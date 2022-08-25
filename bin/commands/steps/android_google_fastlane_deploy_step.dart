import '../../ref.dart';
import '../../secrets_provider/secrets_provider.dart';
import 'build_step.dart';

class AndroidGoogleFastlaneDeployStep extends BuildStep {
  @override
  Future<void> run() async {
    await super.run();

    final secrets = await ref.read(secretsProvider.future);
    final serviceKey = await secrets.getGoogleServiceKey();

    serviceKey.copySync('./android/service_key.json');
    // TODO implement fastlane deploy
    print('exec fastlane');
  }

  @override
  String get summary =>
      'use fastlane to deploy application to google play market';
}
