// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'version_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$VersionInfoTearOff {
  const _$VersionInfoTearOff();

  _VersionInfo call({String version = ''}) {
    return _VersionInfo(
      version: version,
    );
  }
}

/// @nodoc
const $VersionInfo = _$VersionInfoTearOff();

/// @nodoc
mixin _$VersionInfo {
  String get version => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VersionInfoCopyWith<VersionInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VersionInfoCopyWith<$Res> {
  factory $VersionInfoCopyWith(
          VersionInfo value, $Res Function(VersionInfo) then) =
      _$VersionInfoCopyWithImpl<$Res>;
  $Res call({String version});
}

/// @nodoc
class _$VersionInfoCopyWithImpl<$Res> implements $VersionInfoCopyWith<$Res> {
  _$VersionInfoCopyWithImpl(this._value, this._then);

  final VersionInfo _value;
  // ignore: unused_field
  final $Res Function(VersionInfo) _then;

  @override
  $Res call({
    Object? version = freezed,
  }) {
    return _then(_value.copyWith(
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$VersionInfoCopyWith<$Res>
    implements $VersionInfoCopyWith<$Res> {
  factory _$VersionInfoCopyWith(
          _VersionInfo value, $Res Function(_VersionInfo) then) =
      __$VersionInfoCopyWithImpl<$Res>;
  @override
  $Res call({String version});
}

/// @nodoc
class __$VersionInfoCopyWithImpl<$Res> extends _$VersionInfoCopyWithImpl<$Res>
    implements _$VersionInfoCopyWith<$Res> {
  __$VersionInfoCopyWithImpl(
      _VersionInfo _value, $Res Function(_VersionInfo) _then)
      : super(_value, (v) => _then(v as _VersionInfo));

  @override
  _VersionInfo get _value => super._value as _VersionInfo;

  @override
  $Res call({
    Object? version = freezed,
  }) {
    return _then(_VersionInfo(
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_VersionInfo implements _VersionInfo {
  const _$_VersionInfo({this.version = ''});

  @JsonKey(defaultValue: '')
  @override
  final String version;

  @override
  String toString() {
    return 'VersionInfo(version: $version)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _VersionInfo &&
            (identical(other.version, version) ||
                const DeepCollectionEquality().equals(other.version, version)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(version);

  @JsonKey(ignore: true)
  @override
  _$VersionInfoCopyWith<_VersionInfo> get copyWith =>
      __$VersionInfoCopyWithImpl<_VersionInfo>(this, _$identity);
}

abstract class _VersionInfo implements VersionInfo {
  const factory _VersionInfo({String version}) = _$_VersionInfo;

  @override
  String get version => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$VersionInfoCopyWith<_VersionInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
