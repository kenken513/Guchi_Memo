import 'package:flutter_guchi_memo/model/setting_state/setting_state.dart';
import 'package:flutter_guchi_memo/repository/shared_preference_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final settingProvider =
    StateNotifierProvider.autoDispose<SettingController, SettingState>(
  (ref) => SettingController(
    ref.read(sharedPreferenceRepositoryProvider),
  ),
);

class SettingController extends StateNotifier<SettingState> {
  SettingController(
    this._sharedPreferenceRepository,
  ) : super(const SettingState()) {
    Future(() async {
      await fetchActive();
      await fetchAuthState();
    });
  }

  final SharedPreferenceRepository _sharedPreferenceRepository;

  Future<void> fetchActive() async {
    final sharedValue = await _sharedPreferenceRepository.fetchActivePrefs();
    state = state.copyWith(active: sharedValue);
  }

  Future<void> onCnaged({required bool value}) async {
    state = state.copyWith(active: value);
    await _sharedPreferenceRepository.setActive(value: value);
  }

  Future<void> fetchAuthState() async {
    final sharedValue = await _sharedPreferenceRepository.fetchAuthState();
    state = state.copyWith(authState: sharedValue);
  }

  Future<void> onCnagedAuthState({required bool value}) async {
    state = state.copyWith(authState: value);
    await _sharedPreferenceRepository.setAuthState(value: value);
  }
}
