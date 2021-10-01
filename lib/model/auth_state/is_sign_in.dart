import 'package:freezed_annotation/freezed_annotation.dart';

part 'is_sign_in.freezed.dart';

@freezed
class IsSignInState with _$IsSignInState {
  const factory IsSignInState({
    @Default(false) bool isSignIn,
  }) = _IsSignInState;
}
