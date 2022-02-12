import 'package:flutter/material.dart';
import 'package:flutter_guchi_memo/model/auth_state/auth_state.dart';

import 'package:flutter_guchi_memo/repository/shared_preference_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authProvider = StateNotifierProvider<AuthController, AuthState>(
  (ref) => AuthController(
    ref.read(sharedPreferenceRepositoryProvider),
  ),
);

class AuthController extends StateNotifier<AuthState>
    with WidgetsBindingObserver {
  AuthController(this._sharedPreferenceRepository) : super(const AuthState()) {
    initState();
  }

  final SharedPreferenceRepository _sharedPreferenceRepository;

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

  void initState() {
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

  void changeIsSignIn() {
    state = state.copyWith(isSignIn: true);
  }
}
