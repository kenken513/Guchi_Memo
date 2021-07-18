import 'package:flutter_guchi_memo/guchi.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'guchi_state.freezed.dart';

@freezed
class GuchiState with _$GuchiState {
  const factory GuchiState({
    @Default(<Guchi>[]) List<Guchi> guchiList,
  }) = _GuchiState;
}
