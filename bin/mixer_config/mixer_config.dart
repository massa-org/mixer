import 'package:freezed_annotation/freezed_annotation.dart';

part 'mixer_config.freezed.dart';
part 'mixer_config.g.dart';

@Freezed(unionKey: 'type')
abstract class MixerConfig implements _$MixerConfig {
  const MixerConfig._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory MixerConfig.flat() = _Flat;

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory MixerConfig.flavorful({
    @Default('flavors') String flavorsDirectory,
    @Default('fallback') String fallbackFlavor,
  }) = _Flavorful;

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory MixerConfig.spicy({
    required String spicyDirectory,
  }) = _Spicy;

  factory MixerConfig.fromJson(Map<String, dynamic> json) =>
      _$MixerConfigFromJson(json);
}
