import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_state.freezed.dart';

//愚痴モデル型の配列を定義
@freezed
class SettingState with _$SettingState {
  const factory SettingState({
    @Default('') String version,
    @Default(true) bool active,
  }) = _SettingState;
}
