import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:flutter_guchi_memo/common/audio_file.dart';
import 'package:flutter_guchi_memo/repository/shared_preference_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final audioCacheProvider = Provider((ref) => AudioCache());

final soundAction = Provider<SoundAction>((ref) => SoundAction(ref.read));

class SoundAction {
  SoundAction(this._read);

  final Reader _read;

  AudioCache get _audioCache => _read(audioCacheProvider);

  SharedPreferenceRepository get _sharedPreferenceRepository =>
      _read(sharedPreferenceRepositoryProvider);

  void soundActionPantiSmall() {
    _audioCache.play(AudioFile.panti.value);
  }

  void soundActionPantiBig() {
    _audioCache.play(AudioFile.panti_big.value);
  }

  Future<void> soundActionOnChange() async {
    final active = await _sharedPreferenceRepository.fetchActivePrefs();
    if (active) {
      await Future.wait([
        _audioCache.play(AudioFile.panti.value),
        HapticFeedback.heavyImpact(),
      ]);
      return;
    }
    await HapticFeedback.heavyImpact();
  }

  Future<void> soundAction() async {
    final active = await _sharedPreferenceRepository.fetchActivePrefs();
    if (active) {
      await Future.wait([
        _audioCache.play(AudioFile.panti_big.value),
        HapticFeedback.heavyImpact(),
      ]);
      return;
    }
    await HapticFeedback.heavyImpact();
  }
}
