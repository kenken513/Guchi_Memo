import 'package:flutter/material.dart';
import 'package:flutter_guchi_memo/model/Version/version_info.dart';
import 'package:flutter_guchi_memo/model/panti/panti.dart';
import 'package:flutter_guchi_memo/repository/package_info_repository.dart';
import 'package:flutter_guchi_memo/repository/shared_preference_repository.dart';
import 'package:flutter_guchi_memo/view_model/setting_page_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _settingProvider =
    StateNotifierProvider.autoDispose<SettingPageViewModel, Panti>(
  (ref) => SettingPageViewModel(
    ref.read(sharedPreferenceRepositoryProvider),
  ),
);

final _versionProvider =
    StateNotifierProvider.autoDispose<VersionViewModel, VersionInfo>(
  (ref) => VersionViewModel(
    ref.read(packageInfoRepositoryProvider),
  ),
);

class SettingPage extends ConsumerWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final state = watch(_settingProvider);
    final viewModel = watch(_settingProvider.notifier);
    final versionState = watch(_versionProvider);
    final active = state.active;
    return Scaffold(
      appBar: AppBar(
        title: const Text('設定'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white70,
                ),
                child: SwitchListTile(
                  value: active,
                  activeColor: Colors.pink,
                  activeTrackColor: Colors.pink,
                  inactiveThumbColor: Colors.grey,
                  inactiveTrackColor: Colors.grey,
                  secondary: const Icon(Icons.volume_up),
                  title: Text('効果音 ${active ? 'ON' : 'OFF'}'),
                  onChanged: (bool value) async {
                    await viewModel.onCnaged(value: value);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white70,
                ),
                child: ListTile(
                  title: const Text('アプリバージョン'),
                  subtitle: Text(
                    versionState.version,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
