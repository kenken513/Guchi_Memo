enum AudioFile {
  panti,
}

extension AudioFileExtension on AudioFile {
  String get value {
    return '${toString().replaceAll('$runtimeType.', '')}.mp3';
  }
}
