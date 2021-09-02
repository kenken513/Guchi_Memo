import 'package:flutter_guchi_memo/model/setting_state/setting_state.dart';
import 'package:flutter_guchi_memo/repository/package_info_repository.dart';
import 'package:flutter_guchi_memo/repository/shared_preference_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final settingPageViewModelProvider =
    StateNotifierProvider.autoDispose<SettingPageViewModel, SettingState>(
  (ref) => SettingPageViewModel(
    ref.read(packageInfoRepositoryProvider),
    ref.read(sharedPreferenceRepositoryProvider),
  ),
);

class SettingPageViewModel extends StateNotifier<SettingState> {
  SettingPageViewModel(
      this._packageInfoRepository, this._sharedPreferenceRepository)
      : super(const SettingState()) {
    fetchActive();
  }

  final SharedPreferenceRepository _sharedPreferenceRepository;

  final PackageInfoRepository _packageInfoRepository;

  void setAppVersion() {
    final appVersion = _packageInfoRepository.fetchAppVersion();
    state = state.copyWith(version: appVersion);
  }

  Future<void> fetchActive() async {
    final sharedValue = await _sharedPreferenceRepository.fetchActivePrefs();
    state = state.copyWith(active: sharedValue);
  }

  Future<void> onCnaged({required bool value}) async {
    state = state.copyWith(active: value);
    await _sharedPreferenceRepository.setActive(value: value);
  }
}
