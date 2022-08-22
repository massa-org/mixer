import 'package:freezed_annotation/freezed_annotation.dart';

part 'mixer_config.freezed.dart';
part 'mixer_config.g.dart';

@freezed
abstract class MixerConfig implements _$MixerConfig {
  const MixerConfig._();

  const factory MixerConfig.flat() = _Flat;
  const factory MixerConfig.flavorful({
    @Default("flavors") String flavorsDirectory,
  }) = _Flavorful;
  const factory MixerConfig.spicy({
    required String spicyDirectory,
  }) = _Spicy;

  factory MixerConfig.fromJson(Map<String, dynamic> json) =>
      _$MixerConfigFromJson(json);
}
