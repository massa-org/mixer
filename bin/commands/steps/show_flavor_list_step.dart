import '../../flavor_strategy/flavor_provider.dart';
import '../../ref.dart';
import 'build_step.dart';

class ShowFlavorListStep extends BuildStep {
  ShowFlavorListStep(this.message);

  final String? message;

  @override
  Future<void> run() async {
    await super.run();
    final flavorStrategy = await ref.read(flavorStrategyProvider.future);
    final flavors = await flavorStrategy.getFlavorList();

    if (message != null) {
      print(message);
    }
    print(
      'List of allowed flavors: [${flavors.map((e) => e.flavorId).join(',')}]',
    );
  }

  @override
  String get summary => 'show allowed flavor list';
}
