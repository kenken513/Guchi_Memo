import 'package:flutter_guchi_memo/repository/shared_preference_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final settingControllerProvider = Provider((ref) => SettingController(
      ref.read(sharedPreferenceRepositoryProvider),
    ));

class SettingController {
  SettingController(
    this._sharedPreferenceRepository,
  );

  final SharedPreferenceRepository _sharedPreferenceRepository;

  Future<bool> fetchIsSoundActive() {
    return _sharedPreferenceRepository.fetchActivePrefs();
  }

  Future<void> setIsSoundActive({required bool value}) async {
    await _sharedPreferenceRepository.setActive(value: value);
  }

  Future<bool> fetchIsLocked() {
    return _sharedPreferenceRepository.fetchIsLocked();
  }

  Future<void> setIsLocked({required bool value}) async {
    await _sharedPreferenceRepository.setAuthState(value: value);
  }
}
