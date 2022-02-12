import 'package:flutter_guchi_memo/repository/package_info_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final fetchAppVersion = Provider<String>(
  (ref) => ref.read(packageInfoRepositoryProvider).appVersion,
);
