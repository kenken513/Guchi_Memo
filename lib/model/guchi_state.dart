import 'package:freezed_annotation/freezed_annotation.dart';

import 'guchi.dart';

part 'guchi_state.freezed.dart';

//愚痴モデル型の配列を定義
@freezed
class GuchiState with _$GuchiState {
  const factory GuchiState({
    @Default(<Guchi>[]) List<Guchi> guchiList,
  }) = _GuchiState;
}
