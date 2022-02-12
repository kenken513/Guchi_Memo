// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guchi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Guchi _$$_GuchiFromJson(Map<String, dynamic> json) => _$_Guchi(
      id: json['id'] as int?,
      text: json['text'] as String? ?? '',
      content: json['content'] as String? ?? '',
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      editedAt: json['editedAt'] == null
          ? null
          : DateTime.parse(json['editedAt'] as String),
    );

Map<String, dynamic> _$$_GuchiToJson(_$_Guchi instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'content': instance.content,
      'createdAt': instance.createdAt?.toIso8601String(),
      'editedAt': instance.editedAt?.toIso8601String(),
    };
