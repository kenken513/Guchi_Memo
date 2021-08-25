// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'panti.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PantiTearOff {
  const _$PantiTearOff();

  _Panti call({bool active = true}) {
    return _Panti(
      active: active,
    );
  }
}

/// @nodoc
const $Panti = _$PantiTearOff();

/// @nodoc
mixin _$Panti {
  bool get active => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PantiCopyWith<Panti> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PantiCopyWith<$Res> {
  factory $PantiCopyWith(Panti value, $Res Function(Panti) then) =
      _$PantiCopyWithImpl<$Res>;
  $Res call({bool active});
}

/// @nodoc
class _$PantiCopyWithImpl<$Res> implements $PantiCopyWith<$Res> {
  _$PantiCopyWithImpl(this._value, this._then);

  final Panti _value;
  // ignore: unused_field
  final $Res Function(Panti) _then;

  @override
  $Res call({
    Object? active = freezed,
  }) {
    return _then(_value.copyWith(
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$PantiCopyWith<$Res> implements $PantiCopyWith<$Res> {
  factory _$PantiCopyWith(_Panti value, $Res Function(_Panti) then) =
      __$PantiCopyWithImpl<$Res>;
  @override
  $Res call({bool active});
}

/// @nodoc
class __$PantiCopyWithImpl<$Res> extends _$PantiCopyWithImpl<$Res>
    implements _$PantiCopyWith<$Res> {
  __$PantiCopyWithImpl(_Panti _value, $Res Function(_Panti) _then)
      : super(_value, (v) => _then(v as _Panti));

  @override
  _Panti get _value => super._value as _Panti;

  @override
  $Res call({
    Object? active = freezed,
  }) {
    return _then(_Panti(
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Panti implements _Panti {
  const _$_Panti({this.active = true});

  @JsonKey(defaultValue: true)
  @override
  final bool active;

  @override
  String toString() {
    return 'Panti(active: $active)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Panti &&
            (identical(other.active, active) ||
                const DeepCollectionEquality().equals(other.active, active)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(active);

  @JsonKey(ignore: true)
  @override
  _$PantiCopyWith<_Panti> get copyWith =>
      __$PantiCopyWithImpl<_Panti>(this, _$identity);
}

abstract class _Panti implements Panti {
  const factory _Panti({bool active}) = _$_Panti;

  @override
  bool get active => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PantiCopyWith<_Panti> get copyWith => throw _privateConstructorUsedError;
}
