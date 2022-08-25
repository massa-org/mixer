// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mixer_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Flat _$$_FlatFromJson(Map<String, dynamic> json) => _$_Flat(
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$_FlatToJson(_$_Flat instance) => <String, dynamic>{
      'type': instance.$type,
    };

_$_Flavorful _$$_FlavorfulFromJson(Map<String, dynamic> json) => _$_Flavorful(
      flavorsDirectory: json['flavors_directory'] as String? ?? 'flavors',
      fallbackFlavor: json['fallback_flavor'] as String? ?? 'fallback',
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$_FlavorfulToJson(_$_Flavorful instance) =>
    <String, dynamic>{
      'flavors_directory': instance.flavorsDirectory,
      'fallback_flavor': instance.fallbackFlavor,
      'type': instance.$type,
    };

_$_Spicy _$$_SpicyFromJson(Map<String, dynamic> json) => _$_Spicy(
      spicyDirectory: json['spicy_directory'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$_SpicyToJson(_$_Spicy instance) => <String, dynamic>{
      'spicy_directory': instance.spicyDirectory,
      'type': instance.$type,
    };
