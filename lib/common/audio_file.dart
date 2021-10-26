enum AudioFile {
  panti,
  panti_big,
}

extension AudioFileExtension on AudioFile {
  String get value {
    return '${toString().replaceAll('$runtimeType.', '')}.mp3';
  }
}
