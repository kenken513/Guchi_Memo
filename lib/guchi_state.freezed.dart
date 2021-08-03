// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'guchi_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GuchiStateTearOff {
  const _$GuchiStateTearOff();

  _GuchiState call({List<Guchi> guchiList = const <Guchi>[]}) {
    return _GuchiState(
      guchiList: guchiList,
    );
  }
}

/// @nodoc
const $GuchiState = _$GuchiStateTearOff();

/// @nodoc
mixin _$GuchiState {
  List<Guchi> get guchiList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GuchiStateCopyWith<GuchiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuchiStateCopyWith<$Res> {
  factory $GuchiStateCopyWith(
          GuchiState value, $Res Function(GuchiState) then) =
      _$GuchiStateCopyWithImpl<$Res>;
  $Res call({List<Guchi> guchiList});
}

/// @nodoc
class _$GuchiStateCopyWithImpl<$Res> implements $GuchiStateCopyWith<$Res> {
  _$GuchiStateCopyWithImpl(this._value, this._then);

  final GuchiState _value;
  // ignore: unused_field
  final $Res Function(GuchiState) _then;

  @override
  $Res call({
    Object? guchiList = freezed,
  }) {
    return _then(_value.copyWith(
      guchiList: guchiList == freezed
          ? _value.guchiList
          : guchiList // ignore: cast_nullable_to_non_nullable
              as List<Guchi>,
    ));
  }
}

/// @nodoc
abstract class _$GuchiStateCopyWith<$Res> implements $GuchiStateCopyWith<$Res> {
  factory _$GuchiStateCopyWith(
          _GuchiState value, $Res Function(_GuchiState) then) =
      __$GuchiStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Guchi> guchiList});
}

/// @nodoc
class __$GuchiStateCopyWithImpl<$Res> extends _$GuchiStateCopyWithImpl<$Res>
    implements _$GuchiStateCopyWith<$Res> {
  __$GuchiStateCopyWithImpl(
      _GuchiState _value, $Res Function(_GuchiState) _then)
      : super(_value, (v) => _then(v as _GuchiState));

  @override
  _GuchiState get _value => super._value as _GuchiState;

  @override
  $Res call({
    Object? guchiList = freezed,
  }) {
    return _then(_GuchiState(
      guchiList: guchiList == freezed
          ? _value.guchiList
          : guchiList // ignore: cast_nullable_to_non_nullable
              as List<Guchi>,
    ));
  }
}

/// @nodoc

class _$_GuchiState implements _GuchiState {
  const _$_GuchiState({this.guchiList = const <Guchi>[]});

  @JsonKey(defaultValue: const <Guchi>[])
  @override
  final List<Guchi> guchiList;

  @override
  String toString() {
    return 'GuchiState(guchiList: $guchiList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GuchiState &&
            (identical(other.guchiList, guchiList) ||
                const DeepCollectionEquality()
                    .equals(other.guchiList, guchiList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(guchiList);

  @JsonKey(ignore: true)
  @override
  _$GuchiStateCopyWith<_GuchiState> get copyWith =>
      __$GuchiStateCopyWithImpl<_GuchiState>(this, _$identity);
}

abstract class _GuchiState implements GuchiState {
  const factory _GuchiState({List<Guchi> guchiList}) = _$_GuchiState;

  @override
  List<Guchi> get guchiList => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GuchiStateCopyWith<_GuchiState> get copyWith =>
      throw _privateConstructorUsedError;
}
