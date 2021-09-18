import 'package:flutter/material.dart';
import 'package:flutter_guchi_memo/model/auth_state/is_sign_in.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_auth/local_auth.dart';

final authProvider =
    StateNotifierProvider.autoDispose<AuthController, IsSignInState>(
  (ref) => AuthController(),
);

class AuthController extends StateNotifier<IsSignInState>
    with WidgetsBindingObserver {
  AuthController() : super(const IsSignInState()) {
    Future(() async {
      canCheckBiometrics = await isCanCheckBiometrics();
    });
  }

  final _auth = LocalAuthentication();

  late bool canCheckBiometrics;

  Future<void> changeIsSignIn() async {
    state = state.copyWith(isSignIn: true);
  }

  Future<bool> isCanCheckBiometrics() async {
    final canCheckBiometrics = await _auth.canCheckBiometrics;
    return canCheckBiometrics;
  }

  Future<List<BiometricType>> isAvailable() async {
    final a = await _auth.getAvailableBiometrics();
    return a;
  }

  Future<void> authenticate() async {
    final availableBiometrics = await _auth.getAvailableBiometrics();

    if (availableBiometrics.contains(BiometricType.face) ||
        availableBiometrics.contains(BiometricType.fingerprint)) {
      final result = await _auth.authenticate(
        localizedReason: 'Please authenticate to show account balance',
        useErrorDialogs: true,
        stickyAuth: true,
        biometricOnly: true,
      );
      if (result) {
        await changeIsSignIn();
      }
    }
  }
}
