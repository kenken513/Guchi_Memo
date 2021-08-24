import 'package:freezed_annotation/freezed_annotation.dart';

part 'version_info.freezed.dart';

//愚痴モデル型の配列を定義
@freezed
class VersionInfo with _$VersionInfo {
  const factory VersionInfo({
    @Default('') String version,
  }) = _VersionInfo;
}
