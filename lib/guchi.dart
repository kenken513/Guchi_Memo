import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'guchi.freezed.dart';
part 'guchi.g.dart';

//愚痴モデルを定義
@freezed
class Guchi with _$Guchi {
  const factory Guchi({
    String? id,
    @Default('') String text,
    @Default('') String content,
    DateTime? createdAt,
    DateTime? editedAt,
  }) = _Guchi;

  factory Guchi.fromJson(Map<String, dynamic> json) => _$GuchiFromJson(json);
}
