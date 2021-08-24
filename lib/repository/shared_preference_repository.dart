import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferenceRepositoryProvider =
    Provider<SharedPreferenceRepository>((_) => throw UnimplementedError());

class SharedPreferenceRepository {
  SharedPreferenceRepository(this._sharedPreferences);
  final SharedPreferences _sharedPreferences;

  Future<bool> setActive({required bool value}) async {
    final prefs = _sharedPreferences;
    final sharedValue = await prefs.setBool('active', value);
    return sharedValue;
  }

  Future<bool> fetchActivePrefs() async {
    final prefs = _sharedPreferences;
    final sharedValue = prefs.getBool('active') ?? true;
    return sharedValue;
  }
}
