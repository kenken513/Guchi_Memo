import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(false) bool isSignIn,
    @Default(false) bool canCheckBiometrics,
  }) = _AuthState;
}
