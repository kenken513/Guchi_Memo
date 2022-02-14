import 'package:flutter/material.dart';
import 'package:flutter_guchi_memo/model/auth_state/auth_state.dart';

import 'package:flutter_guchi_memo/repository/shared_preference_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authProvider = StateNotifierProvider<AuthController, AuthState>(
  (ref) => AuthController(ref.read),
);

class AuthController extends StateNotifier<AuthState>
    with WidgetsBindingObserver {
  AuthController(this._read) : super(const AuthState());

  final Reader _read;

  SharedPreferenceRepository get _sharedPreferenceRepository =>
      _read(sharedPreferenceRepositoryProvider);

  Future<void> changeIsSignInBackground() async {
    final isLocked = await _sharedPreferenceRepository.fetchIsLocked();
    if (isLocked) {
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
