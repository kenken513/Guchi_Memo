enum SharedPreferenceKey {
  active,
  authState,
  startUpGuideState,
}

extension SharedPreferenceKeyExtension on SharedPreferenceKey {
  String get value {
    return toString().replaceAll('$runtimeType.', '');
  }
}
