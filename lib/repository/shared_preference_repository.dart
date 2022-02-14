import 'package:flutter_guchi_memo/common/shared_preference_key.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferenceRepositoryProvider =
    Provider<SharedPreferenceRepository>((_) => throw UnimplementedError());

class SharedPreferenceRepository {
  SharedPreferenceRepository(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  bool get fetchActivePrefs =>
      _sharedPreferences.getBool(SharedPreferenceKey.active.value) ?? true;

  bool get fetchIsLocked =>
      _sharedPreferences.getBool(SharedPreferenceKey.authState.value) ?? false;

  bool get fetchStartUpGuideState =>
      _sharedPreferences.getBool(SharedPreferenceKey.startUpGuideState.value) ??
      true;

  Future<void> setActive({required bool value}) async {
    await _sharedPreferences.setBool(
      SharedPreferenceKey.active.value,
      value,
    );
  }

  Future<void> setAuthState({required bool value}) async {
    await _sharedPreferences.setBool(
      SharedPreferenceKey.authState.value,
      value,
    );
  }

  Future<void> changeStartUpGuideState({required bool value}) async {
    await _sharedPreferences.setBool(
      SharedPreferenceKey.startUpGuideState.value,
      value,
    );
  }
}
