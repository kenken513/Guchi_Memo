import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferenceRepositoryProvider =
    Provider<SharedPreferenceRepository>((_) => SharedPreferenceRepository());

class SharedPreferenceRepository {
  Future<bool> setActive({required bool value}) async {
    final prefs = await SharedPreferences.getInstance();
    final sharedValue = await prefs.setBool('active', value);
    return sharedValue;
  }

  Future<bool> fetchActivePrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final sharedValue = prefs.getBool('active') ?? true;
    return sharedValue;
  }
}
