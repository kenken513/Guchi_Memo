enum SharedPreferenceKey {
  active,
}

extension SharedPreferenceKeyExtension on SharedPreferenceKey {
  String get value {
    return toString();
  }
}
