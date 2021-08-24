import 'package:flutter_guchi_memo/model/panti/panti.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingPageViewModel extends StateNotifier<Panti> {
  SettingPageViewModel() : super(const Panti());

  Future<void> onCnaged({required bool value}) async {
    state = state.copyWith(acrive: value);
  }
}
