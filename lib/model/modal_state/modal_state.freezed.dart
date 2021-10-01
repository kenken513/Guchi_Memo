// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'modal_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ModalStateTearOff {
  const _$ModalStateTearOff();

  _ModalState call({bool isOpen = false}) {
    return _ModalState(
      isOpen: isOpen,
    );
  }
}

/// @nodoc
const $ModalState = _$ModalStateTearOff();

/// @nodoc
mixin _$ModalState {
  bool get isOpen => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ModalStateCopyWith<ModalState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModalStateCopyWith<$Res> {
  factory $ModalStateCopyWith(
          ModalState value, $Res Function(ModalState) then) =
      _$ModalStateCopyWithImpl<$Res>;
  $Res call({bool isOpen});
}

/// @nodoc
class _$ModalStateCopyWithImpl<$Res> implements $ModalStateCopyWith<$Res> {
  _$ModalStateCopyWithImpl(this._value, this._then);

  final ModalState _value;
  // ignore: unused_field
  final $Res Function(ModalState) _then;

  @override
  $Res call({
    Object? isOpen = freezed,
  }) {
    return _then(_value.copyWith(
      isOpen: isOpen == freezed
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$ModalStateCopyWith<$Res> implements $ModalStateCopyWith<$Res> {
  factory _$ModalStateCopyWith(
          _ModalState value, $Res Function(_ModalState) then) =
      __$ModalStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isOpen});
}

/// @nodoc
class __$ModalStateCopyWithImpl<$Res> extends _$ModalStateCopyWithImpl<$Res>
    implements _$ModalStateCopyWith<$Res> {
  __$ModalStateCopyWithImpl(
      _ModalState _value, $Res Function(_ModalState) _then)
      : super(_value, (v) => _then(v as _ModalState));

  @override
  _ModalState get _value => super._value as _ModalState;

  @override
  $Res call({
    Object? isOpen = freezed,
  }) {
    return _then(_ModalState(
      isOpen: isOpen == freezed
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ModalState implements _ModalState {
  const _$_ModalState({this.isOpen = false});

  @JsonKey(defaultValue: false)
  @override
  final bool isOpen;

  @override
  String toString() {
    return 'ModalState(isOpen: $isOpen)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ModalState &&
            (identical(other.isOpen, isOpen) ||
                const DeepCollectionEquality().equals(other.isOpen, isOpen)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(isOpen);

  @JsonKey(ignore: true)
  @override
  _$ModalStateCopyWith<_ModalState> get copyWith =>
      __$ModalStateCopyWithImpl<_ModalState>(this, _$identity);
}

abstract class _ModalState implements ModalState {
  const factory _ModalState({bool isOpen}) = _$_ModalState;

  @override
  bool get isOpen => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ModalStateCopyWith<_ModalState> get copyWith =>
      throw _privateConstructorUsedError;
}
