// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mixer_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MixerConfig _$MixerConfigFromJson(Map<String, dynamic> json) {
  switch (json['type']) {
    case 'flat':
      return _Flat.fromJson(json);
    case 'flavorful':
      return _Flavorful.fromJson(json);
    case 'spicy':
      return _Spicy.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json, 'type', 'MixerConfig', 'Invalid union type "${json['type']}"!');
  }
}

/// @nodoc
mixin _$MixerConfig {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() flat,
    required TResult Function(String flavorsDirectory, String fallbackFlavor)
        flavorful,
    required TResult Function(String spicyDirectory) spicy,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? flat,
    TResult Function(String flavorsDirectory, String fallbackFlavor)? flavorful,
    TResult Function(String spicyDirectory)? spicy,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? flat,
    TResult Function(String flavorsDirectory, String fallbackFlavor)? flavorful,
    TResult Function(String spicyDirectory)? spicy,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Flat value) flat,
    required TResult Function(_Flavorful value) flavorful,
    required TResult Function(_Spicy value) spicy,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Flat value)? flat,
    TResult Function(_Flavorful value)? flavorful,
    TResult Function(_Spicy value)? spicy,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Flat value)? flat,
    TResult Function(_Flavorful value)? flavorful,
    TResult Function(_Spicy value)? spicy,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MixerConfigCopyWith<$Res> {
  factory $MixerConfigCopyWith(
          MixerConfig value, $Res Function(MixerConfig) then) =
      _$MixerConfigCopyWithImpl<$Res>;
}

/// @nodoc
class _$MixerConfigCopyWithImpl<$Res> implements $MixerConfigCopyWith<$Res> {
  _$MixerConfigCopyWithImpl(this._value, this._then);

  final MixerConfig _value;
  // ignore: unused_field
  final $Res Function(MixerConfig) _then;
}

/// @nodoc
abstract class _$$_FlatCopyWith<$Res> {
  factory _$$_FlatCopyWith(_$_Flat value, $Res Function(_$_Flat) then) =
      __$$_FlatCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_FlatCopyWithImpl<$Res> extends _$MixerConfigCopyWithImpl<$Res>
    implements _$$_FlatCopyWith<$Res> {
  __$$_FlatCopyWithImpl(_$_Flat _value, $Res Function(_$_Flat) _then)
      : super(_value, (v) => _then(v as _$_Flat));

  @override
  _$_Flat get _value => super._value as _$_Flat;
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Flat extends _Flat {
  const _$_Flat({final String? $type})
      : $type = $type ?? 'flat',
        super._();

  factory _$_Flat.fromJson(Map<String, dynamic> json) => _$$_FlatFromJson(json);

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'MixerConfig.flat()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Flat);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() flat,
    required TResult Function(String flavorsDirectory, String fallbackFlavor)
        flavorful,
    required TResult Function(String spicyDirectory) spicy,
  }) {
    return flat();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? flat,
    TResult Function(String flavorsDirectory, String fallbackFlavor)? flavorful,
    TResult Function(String spicyDirectory)? spicy,
  }) {
    return flat?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? flat,
    TResult Function(String flavorsDirectory, String fallbackFlavor)? flavorful,
    TResult Function(String spicyDirectory)? spicy,
    required TResult orElse(),
  }) {
    if (flat != null) {
      return flat();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Flat value) flat,
    required TResult Function(_Flavorful value) flavorful,
    required TResult Function(_Spicy value) spicy,
  }) {
    return flat(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Flat value)? flat,
    TResult Function(_Flavorful value)? flavorful,
    TResult Function(_Spicy value)? spicy,
  }) {
    return flat?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Flat value)? flat,
    TResult Function(_Flavorful value)? flavorful,
    TResult Function(_Spicy value)? spicy,
    required TResult orElse(),
  }) {
    if (flat != null) {
      return flat(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_FlatToJson(
      this,
    );
  }
}

abstract class _Flat extends MixerConfig {
  const factory _Flat() = _$_Flat;
  const _Flat._() : super._();

  factory _Flat.fromJson(Map<String, dynamic> json) = _$_Flat.fromJson;
}

/// @nodoc
abstract class _$$_FlavorfulCopyWith<$Res> {
  factory _$$_FlavorfulCopyWith(
          _$_Flavorful value, $Res Function(_$_Flavorful) then) =
      __$$_FlavorfulCopyWithImpl<$Res>;
  $Res call({String flavorsDirectory, String fallbackFlavor});
}

/// @nodoc
class __$$_FlavorfulCopyWithImpl<$Res> extends _$MixerConfigCopyWithImpl<$Res>
    implements _$$_FlavorfulCopyWith<$Res> {
  __$$_FlavorfulCopyWithImpl(
      _$_Flavorful _value, $Res Function(_$_Flavorful) _then)
      : super(_value, (v) => _then(v as _$_Flavorful));

  @override
  _$_Flavorful get _value => super._value as _$_Flavorful;

  @override
  $Res call({
    Object? flavorsDirectory = freezed,
    Object? fallbackFlavor = freezed,
  }) {
    return _then(_$_Flavorful(
      flavorsDirectory: flavorsDirectory == freezed
          ? _value.flavorsDirectory
          : flavorsDirectory // ignore: cast_nullable_to_non_nullable
              as String,
      fallbackFlavor: fallbackFlavor == freezed
          ? _value.fallbackFlavor
          : fallbackFlavor // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Flavorful extends _Flavorful {
  const _$_Flavorful(
      {this.flavorsDirectory = 'flavors',
      this.fallbackFlavor = 'fallback',
      final String? $type})
      : $type = $type ?? 'flavorful',
        super._();

  factory _$_Flavorful.fromJson(Map<String, dynamic> json) =>
      _$$_FlavorfulFromJson(json);

  @override
  @JsonKey()
  final String flavorsDirectory;
  @override
  @JsonKey()
  final String fallbackFlavor;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'MixerConfig.flavorful(flavorsDirectory: $flavorsDirectory, fallbackFlavor: $fallbackFlavor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Flavorful &&
            const DeepCollectionEquality()
                .equals(other.flavorsDirectory, flavorsDirectory) &&
            const DeepCollectionEquality()
                .equals(other.fallbackFlavor, fallbackFlavor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(flavorsDirectory),
      const DeepCollectionEquality().hash(fallbackFlavor));

  @JsonKey(ignore: true)
  @override
  _$$_FlavorfulCopyWith<_$_Flavorful> get copyWith =>
      __$$_FlavorfulCopyWithImpl<_$_Flavorful>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() flat,
    required TResult Function(String flavorsDirectory, String fallbackFlavor)
        flavorful,
    required TResult Function(String spicyDirectory) spicy,
  }) {
    return flavorful(flavorsDirectory, fallbackFlavor);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? flat,
    TResult Function(String flavorsDirectory, String fallbackFlavor)? flavorful,
    TResult Function(String spicyDirectory)? spicy,
  }) {
    return flavorful?.call(flavorsDirectory, fallbackFlavor);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? flat,
    TResult Function(String flavorsDirectory, String fallbackFlavor)? flavorful,
    TResult Function(String spicyDirectory)? spicy,
    required TResult orElse(),
  }) {
    if (flavorful != null) {
      return flavorful(flavorsDirectory, fallbackFlavor);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Flat value) flat,
    required TResult Function(_Flavorful value) flavorful,
    required TResult Function(_Spicy value) spicy,
  }) {
    return flavorful(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Flat value)? flat,
    TResult Function(_Flavorful value)? flavorful,
    TResult Function(_Spicy value)? spicy,
  }) {
    return flavorful?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Flat value)? flat,
    TResult Function(_Flavorful value)? flavorful,
    TResult Function(_Spicy value)? spicy,
    required TResult orElse(),
  }) {
    if (flavorful != null) {
      return flavorful(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_FlavorfulToJson(
      this,
    );
  }
}

abstract class _Flavorful extends MixerConfig {
  const factory _Flavorful(
      {final String flavorsDirectory,
      final String fallbackFlavor}) = _$_Flavorful;
  const _Flavorful._() : super._();

  factory _Flavorful.fromJson(Map<String, dynamic> json) =
      _$_Flavorful.fromJson;

  String get flavorsDirectory;
  String get fallbackFlavor;
  @JsonKey(ignore: true)
  _$$_FlavorfulCopyWith<_$_Flavorful> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SpicyCopyWith<$Res> {
  factory _$$_SpicyCopyWith(_$_Spicy value, $Res Function(_$_Spicy) then) =
      __$$_SpicyCopyWithImpl<$Res>;
  $Res call({String spicyDirectory});
}

/// @nodoc
class __$$_SpicyCopyWithImpl<$Res> extends _$MixerConfigCopyWithImpl<$Res>
    implements _$$_SpicyCopyWith<$Res> {
  __$$_SpicyCopyWithImpl(_$_Spicy _value, $Res Function(_$_Spicy) _then)
      : super(_value, (v) => _then(v as _$_Spicy));

  @override
  _$_Spicy get _value => super._value as _$_Spicy;

  @override
  $Res call({
    Object? spicyDirectory = freezed,
  }) {
    return _then(_$_Spicy(
      spicyDirectory: spicyDirectory == freezed
          ? _value.spicyDirectory
          : spicyDirectory // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Spicy extends _Spicy {
  const _$_Spicy({required this.spicyDirectory, final String? $type})
      : $type = $type ?? 'spicy',
        super._();

  factory _$_Spicy.fromJson(Map<String, dynamic> json) =>
      _$$_SpicyFromJson(json);

  @override
  final String spicyDirectory;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'MixerConfig.spicy(spicyDirectory: $spicyDirectory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Spicy &&
            const DeepCollectionEquality()
                .equals(other.spicyDirectory, spicyDirectory));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(spicyDirectory));

  @JsonKey(ignore: true)
  @override
  _$$_SpicyCopyWith<_$_Spicy> get copyWith =>
      __$$_SpicyCopyWithImpl<_$_Spicy>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() flat,
    required TResult Function(String flavorsDirectory, String fallbackFlavor)
        flavorful,
    required TResult Function(String spicyDirectory) spicy,
  }) {
    return spicy(spicyDirectory);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? flat,
    TResult Function(String flavorsDirectory, String fallbackFlavor)? flavorful,
    TResult Function(String spicyDirectory)? spicy,
  }) {
    return spicy?.call(spicyDirectory);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? flat,
    TResult Function(String flavorsDirectory, String fallbackFlavor)? flavorful,
    TResult Function(String spicyDirectory)? spicy,
    required TResult orElse(),
  }) {
    if (spicy != null) {
      return spicy(spicyDirectory);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Flat value) flat,
    required TResult Function(_Flavorful value) flavorful,
    required TResult Function(_Spicy value) spicy,
  }) {
    return spicy(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Flat value)? flat,
    TResult Function(_Flavorful value)? flavorful,
    TResult Function(_Spicy value)? spicy,
  }) {
    return spicy?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Flat value)? flat,
    TResult Function(_Flavorful value)? flavorful,
    TResult Function(_Spicy value)? spicy,
    required TResult orElse(),
  }) {
    if (spicy != null) {
      return spicy(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_SpicyToJson(
      this,
    );
  }
}

abstract class _Spicy extends MixerConfig {
  const factory _Spicy({required final String spicyDirectory}) = _$_Spicy;
  const _Spicy._() : super._();

  factory _Spicy.fromJson(Map<String, dynamic> json) = _$_Spicy.fromJson;

  String get spicyDirectory;
  @JsonKey(ignore: true)
  _$$_SpicyCopyWith<_$_Spicy> get copyWith =>
      throw _privateConstructorUsedError;
}
