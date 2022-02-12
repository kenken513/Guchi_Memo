import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:local_auth/local_auth.dart';

final localAuthenticationProvider = Provider<LocalAuthentication>(
  (ref) => LocalAuthentication(),
);

final biometricsControllerProvider = Provider<BiometricsController>(
  (ref) => BiometricsController(ref.read),
);

class BiometricsController {
  BiometricsController(this._read);

  final Reader _read;

  LocalAuthentication get _auth => _read(localAuthenticationProvider);

  Future<bool> get canCheckBiometrics => _auth.canCheckBiometrics;

  Future<bool> didAuthenticate() async {
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
