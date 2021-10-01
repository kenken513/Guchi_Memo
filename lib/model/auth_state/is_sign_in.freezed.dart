// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'is_sign_in.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$IsSignInStateTearOff {
  const _$IsSignInStateTearOff();

  _IsSignInState call({bool isSignIn = false}) {
    return _IsSignInState(
      isSignIn: isSignIn,
    );
  }
}

/// @nodoc
const $IsSignInState = _$IsSignInStateTearOff();

/// @nodoc
mixin _$IsSignInState {
  bool get isSignIn => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IsSignInStateCopyWith<IsSignInState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IsSignInStateCopyWith<$Res> {
  factory $IsSignInStateCopyWith(
          IsSignInState value, $Res Function(IsSignInState) then) =
      _$IsSignInStateCopyWithImpl<$Res>;
  $Res call({bool isSignIn});
}

/// @nodoc
class _$IsSignInStateCopyWithImpl<$Res>
    implements $IsSignInStateCopyWith<$Res> {
  _$IsSignInStateCopyWithImpl(this._value, this._then);

  final IsSignInState _value;
  // ignore: unused_field
  final $Res Function(IsSignInState) _then;

  @override
  $Res call({
    Object? isSignIn = freezed,
  }) {
    return _then(_value.copyWith(
      isSignIn: isSignIn == freezed
          ? _value.isSignIn
          : isSignIn // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$IsSignInStateCopyWith<$Res>
    implements $IsSignInStateCopyWith<$Res> {
  factory _$IsSignInStateCopyWith(
          _IsSignInState value, $Res Function(_IsSignInState) then) =
      __$IsSignInStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isSignIn});
}

/// @nodoc
class __$IsSignInStateCopyWithImpl<$Res>
    extends _$IsSignInStateCopyWithImpl<$Res>
    implements _$IsSignInStateCopyWith<$Res> {
  __$IsSignInStateCopyWithImpl(
      _IsSignInState _value, $Res Function(_IsSignInState) _then)
      : super(_value, (v) => _then(v as _IsSignInState));

  @override
  _IsSignInState get _value => super._value as _IsSignInState;

  @override
  $Res call({
    Object? isSignIn = freezed,
  }) {
    return _then(_IsSignInState(
      isSignIn: isSignIn == freezed
          ? _value.isSignIn
          : isSignIn // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_IsSignInState implements _IsSignInState {
  const _$_IsSignInState({this.isSignIn = false});

  @JsonKey(defaultValue: false)
  @override
  final bool isSignIn;

  @override
  String toString() {
    return 'IsSignInState(isSignIn: $isSignIn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _IsSignInState &&
            (identical(other.isSignIn, isSignIn) ||
                const DeepCollectionEquality()
                    .equals(other.isSignIn, isSignIn)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(isSignIn);

  @JsonKey(ignore: true)
  @override
  _$IsSignInStateCopyWith<_IsSignInState> get copyWith =>
      __$IsSignInStateCopyWithImpl<_IsSignInState>(this, _$identity);
}

abstract class _IsSignInState implements IsSignInState {
  const factory _IsSignInState({bool isSignIn}) = _$_IsSignInState;

  @override
  bool get isSignIn => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$IsSignInStateCopyWith<_IsSignInState> get copyWith =>
      throw _privateConstructorUsedError;
}
