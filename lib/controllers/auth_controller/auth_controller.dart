import 'package:flutter/material.dart';
import 'package:flutter_guchi_memo/model/auth_state/is_sign_in.dart';
import 'package:flutter_guchi_memo/repository/auth_repository.dart';

import 'package:flutter_guchi_memo/repository/shared_preference_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_auth/local_auth.dart';

final authProvider = StateNotifierProvider<AuthController, IsSignInState>(
  (ref) => AuthController(
    ref.read(sharedPreferenceRepositoryProvider),
    ref.read(authRepositoryProvider),
  ),
);

class AuthController extends StateNotifier<IsSignInState>
    with WidgetsBindingObserver {
  AuthController(this._sharedPreferenceRepository, this._authRepository)
      : super(const IsSignInState()) {
    Future(() async {
      await initState();
    });
  }

  final SharedPreferenceRepository _sharedPreferenceRepository;
  final AuthRepository _authRepository;

  late bool canCheckBiometrics = _authRepository.fetchcanCheckBiometrics();

  final _auth = LocalAuthentication();

  Future<bool> fetchAuthState() async {
    final autuStaet = await _sharedPreferenceRepository.fetchAuthState();
    return autuStaet;
  }

  Future<void> changeIsSignInBackground() async {
    final autuState = await fetchAuthState();
    if (autuState) {
      state = state.copyWith(isSignIn: false);
    }
  }

  Future<void> initState() async {
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.paused) {
      await changeIsSignInBackground();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  Future<void> changeIsSignIn() async {
    state = state.copyWith(isSignIn: true);
  }

  Future<bool> isCanCheckBiometrics() async {
    final canCheckBiometrics = await _auth.canCheckBiometrics;
    return canCheckBiometrics;
  }

  Future<bool> authenticate() async {
    final availableBiometrics = await _auth.getAvailableBiometrics();
    var result = false;
    if (availableBiometrics.contains(BiometricType.face) ||
        availableBiometrics.contains(BiometricType.fingerprint)) {
      result = await _auth.authenticate(
        localizedReason: 'Please authenticate to show account balance',
        useErrorDialogs: true,
        stickyAuth: true,
        biometricOnly: true,
      );
    }
    return result;
  }
}
