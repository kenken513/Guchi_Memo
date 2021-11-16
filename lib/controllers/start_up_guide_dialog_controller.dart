import 'package:flutter_guchi_memo/model/start_up_guide_state/start_up_guide_state.dart';
import 'package:flutter_guchi_memo/repository/shared_preference_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final startUpGuideDialogProvider =
    StateNotifierProvider<StartUpGuideDialogController, StartUpGuideState>(
  (ref) => StartUpGuideDialogController(
    ref.read(sharedPreferenceRepositoryProvider),
  ),
);

class StartUpGuideDialogController extends StateNotifier<StartUpGuideState> {
  StartUpGuideDialogController(this._sharedPreferenceRepository)
      : super(const StartUpGuideState()) {
    fetchStartUpGuideState();
  }

  final SharedPreferenceRepository _sharedPreferenceRepository;

  Future<void> fetchStartUpGuideState() async {
    final startUpGuideState =
        await _sharedPreferenceRepository.fetchStartUpGuideState();
    state = state.copyWith(startUpGuideState: startUpGuideState);
  }

  Future<void> setStartUpGuideState() async {
    state = state.copyWith(startUpGuideState: false);
    await _sharedPreferenceRepository.changeStartUpGuideState(value: false);
  }
}
