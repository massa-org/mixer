import 'package:args/args.dart';
import 'package:dcli/dcli.dart';
import 'package:riverpod/riverpod.dart';

String? _validateRepositoryLink(String? link, String message) {
  if (link == null) {
    return null;
  }
  final match = RegExp(
    r'^(?:git|ssh|https?|git@[-\w.]+):(\/\/)?(.*?)(\.git)(\/?|\#[-\d\w._]+?)$',
  ).hasMatch(link);

  if (match == false) {
    throw Exception(message);
  }

  if (RegExp('^http').hasMatch(link)) {
    throw Exception('secret repository http repository is not suported');
  }

  return link;
}

String? getSecretRepository(ArgResults? result) =>
    getSecretRepositoryFromArgs(result) ?? getSecretRepositoryFromENV();

String? getSecretRepositoryFromENV() {
  const envKey = 'SECRET_REPOSITORY';

  return _validateRepositoryLink(
    env[envKey],
    'Env variable $envKey has incorrect format',
  );
}

String? getSecretRepositoryFromArgs(ArgResults? result) {
  final link = result?['secretRepository'] as String?;
  return _validateRepositoryLink(
    link,
    'Args variable --secretRepository has incorrect format',
  );
}

final secretsRepositoryProvider = StateProvider<String?>((_) => null);
