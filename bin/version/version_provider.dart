import 'package:args/args.dart';
import 'package:dcli/dcli.dart';
import 'package:riverpod/riverpod.dart';

void _validateVersion(
  String version,
  String message,
) {
  if (!RegExp(r'^v\d+\.\d+\.\d+\+\d+$').hasMatch(version)) {
    throw Exception(
      '$message get $version expected format v0.0.0+0',
    );
  }
}

String getVersionFromGit() {
  final gitVersionString = 'git describe'
      .toList(nothrow: true)
      .firstWhere((e) => true, orElse: () => 'v0.0.1');
  final buildString = 'git rev-list --count HEAD'
      .toList(nothrow: true)
      .firstWhere((e) => true, orElse: () => '1');
  final build = int.tryParse(buildString) ?? 1;
  final matchVersion =
      RegExp(r'v\d+\.\d+\.\d+').firstMatch(gitVersionString)?.group(0);
  final version = matchVersion ?? 'v0.0.1';
  return '$version+$build';
}

String? getVersionFromENV() {
  final envVersion = env['VERSION'];
  if (envVersion == null) {
    return null;
  }
  _validateVersion(envVersion, 'Env variable VERSION has incorrect format');
  return envVersion;
}

String? getVersionFromArgs(ArgResults? result) {
  final version = result?['version'] as String?;
  if (version == null) {
    return null;
  }
  _validateVersion(version, 'Args variable --version has incorrect format');
  return version;
}

String getVersion(ArgResults? result) =>
    getVersionFromArgs(result) ?? getVersionFromENV() ?? getVersionFromGit();

final versionProvider = StateProvider((ref) => 'v0.0.1+1');
