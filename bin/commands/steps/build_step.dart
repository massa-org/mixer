import 'package:dcli/dcli.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

abstract class BuildStep {
  String get summary;

  static List<String> execContext = [];

  @mustCallSuper
  Future<void> run() async {
    print(
      green(
        '\n ${execContext.join(' > ')} > '
        '${runtimeType.toString().replaceAll('Step', '')}'
        ' - $summary',
      ),
    );
  }
}
