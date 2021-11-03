import 'package:freezed_annotation/freezed_annotation.dart';

part 'start_up_guide_state.freezed.dart';

@freezed
class StartUpGuideState with _$StartUpGuideState {
  const factory StartUpGuideState({
    @Default(true) bool startUpGuideState,
  }) = _StartUpGuideState;
}
