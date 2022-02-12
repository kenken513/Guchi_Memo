import 'package:flutter_guchi_memo/model/setting_state/setting_state.dart';
import 'package:flutter_guchi_memo/repository/package_info_repository.dart';
import 'package:flutter_guchi_memo/repository/shared_preference_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final settingProvider =
    StateNotifierProvider.autoDispose<SettingController, SettingState>(
  (ref) => SettingController(
    ref.read(packageInfoRepositoryProvider),
    ref.read(sharedPreferenceRepositoryProvider),
  ),
);

class SettingController extends StateNotifier<SettingState> {
  SettingController(
    this._packageInfoRepository,
    this._sharedPreferenceRepository,
  ) : super(const SettingState()) {
    Future(() async {
      await fetchActive();
      await setAppVersion();
      await fetchAuthState();
    });
  }

  final SharedPreferenceRepository _sharedPreferenceRepository;

  final PackageInfoRepository _packageInfoRepository;

  Future<void> setAppVersion() async {
    final appVersion = _packageInfoRepository.appVersion;
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

  Future<void> fetchAuthState() async {
    final sharedValue = await _sharedPreferenceRepository.fetchAuthState();
    state = state.copyWith(authState: sharedValue);
  }

  Future<void> onCnagedAuthState({required bool value}) async {
    state = state.copyWith(authState: value);
    await _sharedPreferenceRepository.setAuthState(value: value);
  }
}
