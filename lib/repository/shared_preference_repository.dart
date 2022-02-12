import 'package:flutter_guchi_memo/common/shared_preference_key.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferenceRepositoryProvider =
    Provider<SharedPreferenceRepository>((_) => throw UnimplementedError());

class SharedPreferenceRepository {
  SharedPreferenceRepository(this._sharedPreferences);
  final SharedPreferences _sharedPreferences;

  Future<bool> setActive({required bool value}) async {
    final prefs = _sharedPreferences;
    final sharedValue = await prefs.setBool(
      SharedPreferenceKey.active.value,
      value,
    );
    return sharedValue;
  }

  Future<bool> fetchActivePrefs() async {
    final prefs = _sharedPreferences;
    final sharedValue = prefs.getBool(SharedPreferenceKey.active.value) ?? true;
    return sharedValue;
  }

  Future<bool> setAuthState({required bool value}) async {
    final prefs = _sharedPreferences;
    final sharedValue = await prefs.setBool(
      SharedPreferenceKey.authState.value,
      value,
    );
    return sharedValue;
  }

  Future<bool> fetchAuthState() async {
    final prefs = _sharedPreferences;
    final sharedValue =
        prefs.getBool(SharedPreferenceKey.authState.value) ?? false;
    return sharedValue;
  }

  Future<bool> changeStartUpGuideState({required bool value}) async {
    final prefs = _sharedPreferences;
    final sharedValue = await prefs.setBool(
      SharedPreferenceKey.startUpGuideState.value,
      value,
    );
    return sharedValue;
  }

  Future<bool> fetchStartUpGuideState() async {
    final prefs = _sharedPreferences;
    final sharedValue =
        prefs.getBool(SharedPreferenceKey.startUpGuideState.value) ?? true;
    return sharedValue;
  }
}
