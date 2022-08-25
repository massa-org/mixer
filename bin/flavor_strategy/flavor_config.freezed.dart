// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'flavor_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FlavorConfigModel _$FlavorConfigModelFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$FlavorConfigModel {
  String get applicationId => throw _privateConstructorUsedError;
  String get applicationName => throw _privateConstructorUsedError;
  String get deepLinkHost => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FlavorConfigModelCopyWith<FlavorConfigModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlavorConfigModelCopyWith<$Res> {
  factory $FlavorConfigModelCopyWith(
          FlavorConfigModel value, $Res Function(FlavorConfigModel) then) =
      _$FlavorConfigModelCopyWithImpl<$Res>;
  $Res call(
      {String applicationId, String applicationName, String deepLinkHost});
}

/// @nodoc
class _$FlavorConfigModelCopyWithImpl<$Res>
    implements $FlavorConfigModelCopyWith<$Res> {
  _$FlavorConfigModelCopyWithImpl(this._value, this._then);

  final FlavorConfigModel _value;
  // ignore: unused_field
  final $Res Function(FlavorConfigModel) _then;

  @override
  $Res call({
    Object? applicationId = freezed,
    Object? applicationName = freezed,
    Object? deepLinkHost = freezed,
  }) {
    return _then(_value.copyWith(
      applicationId: applicationId == freezed
          ? _value.applicationId
          : applicationId // ignore: cast_nullable_to_non_nullable
              as String,
      applicationName: applicationName == freezed
          ? _value.applicationName
          : applicationName // ignore: cast_nullable_to_non_nullable
              as String,
      deepLinkHost: deepLinkHost == freezed
          ? _value.deepLinkHost
          : deepLinkHost // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_DataCopyWith<$Res>
    implements $FlavorConfigModelCopyWith<$Res> {
  factory _$$_DataCopyWith(_$_Data value, $Res Function(_$_Data) then) =
      __$$_DataCopyWithImpl<$Res>;
  @override
  $Res call(
      {String applicationId, String applicationName, String deepLinkHost});
}

/// @nodoc
class __$$_DataCopyWithImpl<$Res> extends _$FlavorConfigModelCopyWithImpl<$Res>
    implements _$$_DataCopyWith<$Res> {
  __$$_DataCopyWithImpl(_$_Data _value, $Res Function(_$_Data) _then)
      : super(_value, (v) => _then(v as _$_Data));

  @override
  _$_Data get _value => super._value as _$_Data;

  @override
  $Res call({
    Object? applicationId = freezed,
    Object? applicationName = freezed,
    Object? deepLinkHost = freezed,
  }) {
    return _then(_$_Data(
      applicationId: applicationId == freezed
          ? _value.applicationId
          : applicationId // ignore: cast_nullable_to_non_nullable
              as String,
      applicationName: applicationName == freezed
          ? _value.applicationName
          : applicationName // ignore: cast_nullable_to_non_nullable
              as String,
      deepLinkHost: deepLinkHost == freezed
          ? _value.deepLinkHost
          : deepLinkHost // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Data extends _Data {
  const _$_Data(
      {required this.applicationId,
      required this.applicationName,
      required this.deepLinkHost})
      : super._();

  factory _$_Data.fromJson(Map<String, dynamic> json) => _$$_DataFromJson(json);

  @override
  final String applicationId;
  @override
  final String applicationName;
  @override
  final String deepLinkHost;

  @override
  String toString() {
    return 'FlavorConfigModel(applicationId: $applicationId, applicationName: $applicationName, deepLinkHost: $deepLinkHost)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Data &&
            const DeepCollectionEquality()
                .equals(other.applicationId, applicationId) &&
            const DeepCollectionEquality()
                .equals(other.applicationName, applicationName) &&
            const DeepCollectionEquality()
                .equals(other.deepLinkHost, deepLinkHost));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(applicationId),
      const DeepCollectionEquality().hash(applicationName),
      const DeepCollectionEquality().hash(deepLinkHost));

  @JsonKey(ignore: true)
  @override
  _$$_DataCopyWith<_$_Data> get copyWith =>
      __$$_DataCopyWithImpl<_$_Data>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DataToJson(
      this,
    );
  }
}

abstract class _Data extends FlavorConfigModel {
  const factory _Data(
      {required final String applicationId,
      required final String applicationName,
      required final String deepLinkHost}) = _$_Data;
  const _Data._() : super._();

  factory _Data.fromJson(Map<String, dynamic> json) = _$_Data.fromJson;

  @override
  String get applicationId;
  @override
  String get applicationName;
  @override
  String get deepLinkHost;
  @override
  @JsonKey(ignore: true)
  _$$_DataCopyWith<_$_Data> get copyWith => throw _privateConstructorUsedError;
}
