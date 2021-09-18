import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_state.freezed.dart';

@freezed
class SettingState with _$SettingState {
  const factory SettingState({
    @Default('') String version,
    @Default(true) bool active,
    @Default(false) bool authState,
  }) = _SettingState;
}
