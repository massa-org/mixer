import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../utils/decode_yaml.dart';

part 'flavor_config.freezed.dart';
part 'flavor_config.g.dart';

@freezed
abstract class FlavorConfigModel implements _$FlavorConfigModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory FlavorConfigModel({
    required String applicationId,
    required String applicationName,
    required String deepLinkHost,
  }) = _Data;

  const FlavorConfigModel._();

  factory FlavorConfigModel.fromJson(Map<String, dynamic> json) =>
      _$FlavorConfigModelFromJson(json);
}

FlavorConfigModel loadFlavorConfig(File file) {
  if (file.existsSync()) {
    return FlavorConfigModel.fromJson(decodeYaml(file.readAsStringSync()));
  }

  throw Exception(
    "Can't load flavor config from file ${file.path} file is not exists",
  );
}
