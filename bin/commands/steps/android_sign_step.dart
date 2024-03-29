import 'package:path/path.dart';

import '../../build_directory.dart';
import '../../ref.dart';
import '../../secrets_provider/secrets_provider.dart';
import 'build_step.dart';

class AndroidSignStep extends BuildStep {
  @override
  Future<void> run() async {
    await super.run();

    final secrets = await ref.read(secretsProvider.future);
    final keyJks = await secrets.getKeyJks();
    final keyProperty = await secrets.getKeyProperty();

    // TODO check android sign configuration in build gradle
    keyJks.copySync(
      join(ref.read(buildDirectoryProvider), './build/key.jks'),
    );
    keyProperty.copySync(
      join(ref.read(buildDirectoryProvider), './android/key.properties'),
    );
  }

  @override
  String get summary => 'configure signing for android build';
}
