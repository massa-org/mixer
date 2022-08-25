abstract class BuildStep {
  String get summary;
  Future<void> run();
}
