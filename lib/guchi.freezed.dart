// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'guchi.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GuTearOff {
  const _$GuTearOff();

  _Gu call(
      {String id = '',
      String text = '',
      String content = '',
      DateTime? createdAt,
      DateTime? editedAt}) {
    return _Gu(
      id: id,
      text: text,
      content: content,
      createdAt: createdAt,
      editedAt: editedAt,
    );
  }
}

/// @nodoc
const $Gu = _$GuTearOff();

/// @nodoc
mixin _$Gu {
  String get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get editedAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GuCopyWith<Gu> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuCopyWith<$Res> {
  factory $GuCopyWith(Gu value, $Res Function(Gu) then) =
      _$GuCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String text,
      String content,
      DateTime? createdAt,
      DateTime? editedAt});
}

/// @nodoc
class _$GuCopyWithImpl<$Res> implements $GuCopyWith<$Res> {
  _$GuCopyWithImpl(this._value, this._then);

  final Gu _value;
  // ignore: unused_field
  final $Res Function(Gu) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? content = freezed,
    Object? createdAt = freezed,
    Object? editedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      editedAt: editedAt == freezed
          ? _value.editedAt
          : editedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$GuCopyWith<$Res> implements $GuCopyWith<$Res> {
  factory _$GuCopyWith(_Gu value, $Res Function(_Gu) then) =
      __$GuCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String text,
      String content,
      DateTime? createdAt,
      DateTime? editedAt});
}

/// @nodoc
class __$GuCopyWithImpl<$Res> extends _$GuCopyWithImpl<$Res>
    implements _$GuCopyWith<$Res> {
  __$GuCopyWithImpl(_Gu _value, $Res Function(_Gu) _then)
      : super(_value, (v) => _then(v as _Gu));

  @override
  _Gu get _value => super._value as _Gu;

  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? content = freezed,
    Object? createdAt = freezed,
    Object? editedAt = freezed,
  }) {
    return _then(_Gu(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      editedAt: editedAt == freezed
          ? _value.editedAt
          : editedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$_Gu implements _Gu {
  const _$_Gu(
      {this.id = '',
      this.text = '',
      this.content = '',
      this.createdAt,
      this.editedAt});

  @JsonKey(defaultValue: '')
  @override
  final String id;
  @JsonKey(defaultValue: '')
  @override
  final String text;
  @JsonKey(defaultValue: '')
  @override
  final String content;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? editedAt;

  @override
  String toString() {
    return 'Gu(id: $id, text: $text, content: $content, createdAt: $createdAt, editedAt: $editedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Gu &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.text, text) ||
                const DeepCollectionEquality().equals(other.text, text)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.editedAt, editedAt) ||
                const DeepCollectionEquality()
                    .equals(other.editedAt, editedAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(text) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(editedAt);

  @JsonKey(ignore: true)
  @override
  _$GuCopyWith<_Gu> get copyWith => __$GuCopyWithImpl<_Gu>(this, _$identity);
}

abstract class _Gu implements Gu {
  const factory _Gu(
      {String id,
      String text,
      String content,
      DateTime? createdAt,
      DateTime? editedAt}) = _$_Gu;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get text => throw _privateConstructorUsedError;
  @override
  String get content => throw _privateConstructorUsedError;
  @override
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @override
  DateTime? get editedAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GuCopyWith<_Gu> get copyWith => throw _privateConstructorUsedError;
}
