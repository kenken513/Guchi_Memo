import 'package:flutter_guchi_memo/repository/shared_preference_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final startUpGuideDialogProvider = Provider<StartUpGuideDialogController>(
  (ref) => StartUpGuideDialogController(
    ref.read,
  ),
);

class StartUpGuideDialogController {
  StartUpGuideDialogController(this._read);

  final Reader _read;

  SharedPreferenceRepository get _sharedPreferenceRepository =>
      _read(sharedPreferenceRepositoryProvider);

  bool get fetchStartUpGuideState =>
      _sharedPreferenceRepository.fetchStartUpGuideState;

  Future<void> setStartUpGuideState() async {
    await _sharedPreferenceRepository.changeStartUpGuideState(value: false);
  }
}
