import 'package:flutter_guchi_memo/guchi/guchi_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final guchiProvider = Provider<GuchiState>((ref) {
  return const GuchiState();
});
