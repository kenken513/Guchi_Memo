enum SharedPreferenceKey {
  active,
  authState,
}

extension SharedPreferenceKeyExtension on SharedPreferenceKey {
  String get value {
    return toString().replaceAll('$runtimeType.', '');
  }
}
