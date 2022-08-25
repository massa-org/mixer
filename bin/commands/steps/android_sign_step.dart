import 'build_step.dart';

class AndroidSignStep extends BuildStep {
  @override
  Future<void> run() {
    throw UnimplementedError('$runtimeType is not implemented yet');
  }

  @override
  String get summary => 'configure signing for android build';
}
