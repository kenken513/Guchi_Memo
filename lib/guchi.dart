class Guchi {
  Guchi({
    this.id,
    required this.text,
    required this.content,
    this.createdAt,
    this.editedAt,
  });
  final String? id;
  final String text;
  final String content;
  final DateTime? createdAt;
  final DateTime? editedAt;

  Map<String, dynamic> toMap() {
    final map = {
      'id': id,
      'text': text,
      'content': content,
      'createdAt': createdAt?.toIso8601String(),
      'editedAt': editedAt?.toIso8601String(),
    };
    return map;
  }
}

//freezedでモデルを定義するとエラーがでた


// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'guchi.freezed.dart';

//愚痴モデルを定義
// @freezed
// class Gu with _$Gu {
//   const factory Gu({
//     @Default('') String id,
//     @Default('') String text,
//     @Default('') String content,
//     DateTime? createdAt,
//     DateTime? editedAt,
//   }) = _Gu;

// Map<String, dynamic> toMap() {
//   final map = {
//     'id': id,
//     'text': text,
//     'content': content,
//     'createdAt': createdAt?.toIso8601String(),
//     'editedAt': editedAt?.toIso8601String(),
//   };
//   return map;
// }
// }


