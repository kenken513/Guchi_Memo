import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

final packageInfoRepositoryProvider = Provider<PackageInfoRepository>(
  (_) => throw UnimplementedError(),
);

class PackageInfoRepository {
  PackageInfoRepository(this._packageInfo);
  final PackageInfo _packageInfo;

  String fetchAppVersion() {
    final version = _packageInfo.version;
    return version;
  }
}
