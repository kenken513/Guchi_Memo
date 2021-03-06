import 'package:flutter_guchi_memo/repository/shared_preference_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final settingControllerProvider =
    Provider((ref) => SettingController(ref.read));

class SettingController {
  SettingController(
    this._read,
  );

  final Reader _read;

  SharedPreferenceRepository get _sharedPreferenceRepository =>
      _read(sharedPreferenceRepositoryProvider);

  bool get fetchIsSoundActive => _sharedPreferenceRepository.fetchActivePrefs;

  Future<void> setIsSoundActive({required bool value}) async {
    await _sharedPreferenceRepository.setActive(value: value);
  }

  bool get fetchIsLocked => _sharedPreferenceRepository.fetchIsLocked;

  Future<void> setIsLocked({required bool value}) async {
    await _sharedPreferenceRepository.setAuthState(value: value);
  }
}
