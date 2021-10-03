import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_auth/local_auth.dart';

final authRepositoryProvider = Provider<AuthRepository>(
  (_) => throw UnimplementedError(),
);

class AuthRepository {
  AuthRepository(this.canCheckBiometrics);
  final auth = LocalAuthentication();
  final bool canCheckBiometrics;

  bool fetchcanCheckBiometrics() {
    return canCheckBiometrics;
  }
}
