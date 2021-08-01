// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'guchi.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Guchi _$GuchiFromJson(Map<String, dynamic> json) {
  return _Guchi.fromJson(json);
}

/// @nodoc
class _$GuchiTearOff {
  const _$GuchiTearOff();

  _Guchi call(
      {String? id,
      String text = '',
      String content = '',
      DateTime? createdAt,
      DateTime? editedAt}) {
    return _Guchi(
      id: id,
      text: text,
      content: content,
      createdAt: createdAt,
      editedAt: editedAt,
    );
  }

  Guchi fromJson(Map<String, Object> json) {
    return Guchi.fromJson(json);
  }
}

/// @nodoc
const $Guchi = _$GuchiTearOff();

/// @nodoc
mixin _$Guchi {
  String? get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get editedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GuchiCopyWith<Guchi> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuchiCopyWith<$Res> {
  factory $GuchiCopyWith(Guchi value, $Res Function(Guchi) then) =
      _$GuchiCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String text,
      String content,
      DateTime? createdAt,
      DateTime? editedAt});
}

/// @nodoc
class _$GuchiCopyWithImpl<$Res> implements $GuchiCopyWith<$Res> {
  _$GuchiCopyWithImpl(this._value, this._then);

  final Guchi _value;
  // ignore: unused_field
  final $Res Function(Guchi) _then;

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
              as String?,
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
abstract class _$GuchiCopyWith<$Res> implements $GuchiCopyWith<$Res> {
  factory _$GuchiCopyWith(_Guchi value, $Res Function(_Guchi) then) =
      __$GuchiCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String text,
      String content,
      DateTime? createdAt,
      DateTime? editedAt});
}

/// @nodoc
class __$GuchiCopyWithImpl<$Res> extends _$GuchiCopyWithImpl<$Res>
    implements _$GuchiCopyWith<$Res> {
  __$GuchiCopyWithImpl(_Guchi _value, $Res Function(_Guchi) _then)
      : super(_value, (v) => _then(v as _Guchi));

  @override
  _Guchi get _value => super._value as _Guchi;

  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? content = freezed,
    Object? createdAt = freezed,
    Object? editedAt = freezed,
  }) {
    return _then(_Guchi(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
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
@JsonSerializable()
class _$_Guchi with DiagnosticableTreeMixin implements _Guchi {
  const _$_Guchi(
      {this.id,
      this.text = '',
      this.content = '',
      this.createdAt,
      this.editedAt});

  factory _$_Guchi.fromJson(Map<String, dynamic> json) =>
      _$_$_GuchiFromJson(json);

  @override
  final String? id;
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
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Guchi(id: $id, text: $text, content: $content, createdAt: $createdAt, editedAt: $editedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Guchi'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('text', text))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('editedAt', editedAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Guchi &&
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
  _$GuchiCopyWith<_Guchi> get copyWith =>
      __$GuchiCopyWithImpl<_Guchi>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GuchiToJson(this);
  }
}

abstract class _Guchi implements Guchi {
  const factory _Guchi(
      {String? id,
      String text,
      String content,
      DateTime? createdAt,
      DateTime? editedAt}) = _$_Guchi;

  factory _Guchi.fromJson(Map<String, dynamic> json) = _$_Guchi.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
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
  _$GuchiCopyWith<_Guchi> get copyWith => throw _privateConstructorUsedError;
}
