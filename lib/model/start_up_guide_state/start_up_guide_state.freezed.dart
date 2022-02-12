// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'start_up_guide_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$StartUpGuideStateTearOff {
  const _$StartUpGuideStateTearOff();

  _StartUpGuideState call({bool startUpGuideState = true}) {
    return _StartUpGuideState(
      startUpGuideState: startUpGuideState,
    );
  }
}

/// @nodoc
const $StartUpGuideState = _$StartUpGuideStateTearOff();

/// @nodoc
mixin _$StartUpGuideState {
  bool get startUpGuideState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StartUpGuideStateCopyWith<StartUpGuideState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartUpGuideStateCopyWith<$Res> {
  factory $StartUpGuideStateCopyWith(
          StartUpGuideState value, $Res Function(StartUpGuideState) then) =
      _$StartUpGuideStateCopyWithImpl<$Res>;
  $Res call({bool startUpGuideState});
}

/// @nodoc
class _$StartUpGuideStateCopyWithImpl<$Res>
    implements $StartUpGuideStateCopyWith<$Res> {
  _$StartUpGuideStateCopyWithImpl(this._value, this._then);

  final StartUpGuideState _value;
  // ignore: unused_field
  final $Res Function(StartUpGuideState) _then;

  @override
  $Res call({
    Object? startUpGuideState = freezed,
  }) {
    return _then(_value.copyWith(
      startUpGuideState: startUpGuideState == freezed
          ? _value.startUpGuideState
          : startUpGuideState // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$StartUpGuideStateCopyWith<$Res>
    implements $StartUpGuideStateCopyWith<$Res> {
  factory _$StartUpGuideStateCopyWith(
          _StartUpGuideState value, $Res Function(_StartUpGuideState) then) =
      __$StartUpGuideStateCopyWithImpl<$Res>;
  @override
  $Res call({bool startUpGuideState});
}

/// @nodoc
class __$StartUpGuideStateCopyWithImpl<$Res>
    extends _$StartUpGuideStateCopyWithImpl<$Res>
    implements _$StartUpGuideStateCopyWith<$Res> {
  __$StartUpGuideStateCopyWithImpl(
      _StartUpGuideState _value, $Res Function(_StartUpGuideState) _then)
      : super(_value, (v) => _then(v as _StartUpGuideState));

  @override
  _StartUpGuideState get _value => super._value as _StartUpGuideState;

  @override
  $Res call({
    Object? startUpGuideState = freezed,
  }) {
    return _then(_StartUpGuideState(
      startUpGuideState: startUpGuideState == freezed
          ? _value.startUpGuideState
          : startUpGuideState // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_StartUpGuideState implements _StartUpGuideState {
  const _$_StartUpGuideState({this.startUpGuideState = true});

  @JsonKey()
  @override
  final bool startUpGuideState;

  @override
  String toString() {
    return 'StartUpGuideState(startUpGuideState: $startUpGuideState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StartUpGuideState &&
            const DeepCollectionEquality()
                .equals(other.startUpGuideState, startUpGuideState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(startUpGuideState));

  @JsonKey(ignore: true)
  @override
  _$StartUpGuideStateCopyWith<_StartUpGuideState> get copyWith =>
      __$StartUpGuideStateCopyWithImpl<_StartUpGuideState>(this, _$identity);
}

abstract class _StartUpGuideState implements StartUpGuideState {
  const factory _StartUpGuideState({bool startUpGuideState}) =
      _$_StartUpGuideState;

  @override
  bool get startUpGuideState;
  @override
  @JsonKey(ignore: true)
  _$StartUpGuideStateCopyWith<_StartUpGuideState> get copyWith =>
      throw _privateConstructorUsedError;
}
