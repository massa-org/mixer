import 'dart:convert';

import 'package:yaml/yaml.dart';

Map<String, dynamic> decodeYaml(String yaml) =>
    jsonDecode(jsonEncode(loadYaml(yaml))) as Map<String, dynamic>;
