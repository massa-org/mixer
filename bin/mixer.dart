#! /usr/bin/env dart
// ignore_for_file: avoid_catches_without_on_clauses

// ignore: prefer_relative_imports
import 'package:args/command_runner.dart';
import 'package:dcli/dcli.dart';
import 'package:shutdown/shutdown.dart' as shutdown;

import 'commands/build_command.dart';
import 'commands/full_build_command.dart';
import 'commands/switch_command.dart';
import 'ref.dart';

/// dcli script generated by:
/// dcli create %scriptname%
///
/// See
/// https://pub.dev/packages/dcli#-installing-tab-
///
/// For details on installing dcli.
///
void main(List<String> args) async {
  shutdown.triggerOnSigInt();
  shutdown.triggerOnSigHup();
  shutdown.addHandler(ref.dispose);

  try {
    final runner = CommandRunner<void>('mixer', 'build system for reduce fat')
      ..addCommand(BuildCommand())
      ..addCommand(FullBuildCommand())
      ..addCommand(SwitchFlavorCommand());

    await runner.run(args);
  } catch (error, stackTrace) {
    print(red(error.toString()));
    print(stackTrace);
  } finally {
    await shutdown.shutdown();
  }
}
