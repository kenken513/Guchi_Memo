import 'package:flutter_guchi_memo/model/panti/panti.dart';
import 'package:flutter_guchi_memo/repository/shared_preference_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingPageViewModel extends StateNotifier<Panti> {
  SettingPageViewModel(this._sharedPreferenceRepository)
      : super(const Panti()) {
    fetchActive();
  }

  final SharedPreferenceRepository _sharedPreferenceRepository;

  Future<void> fetchActive() async {
    final sharedValue = await _sharedPreferenceRepository.fetchActivePrefs();
    state = state.copyWith(acrive: sharedValue);
  }

  Future<void> onCnaged({required bool value}) async {
    state = state.copyWith(acrive: value);
    await _sharedPreferenceRepository.setActive(value: value);
  }
}
