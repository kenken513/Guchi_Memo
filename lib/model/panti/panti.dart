import 'package:freezed_annotation/freezed_annotation.dart';

part 'panti.freezed.dart';

//愚痴モデル型の配列を定義
@freezed
class Panti with _$Panti {
  const factory Panti({
    @Default(true) bool active,
  }) = _Panti;
}
