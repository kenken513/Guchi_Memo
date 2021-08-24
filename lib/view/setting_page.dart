import 'package:flutter/material.dart';
import 'package:flutter_guchi_memo/model/panti/panti.dart';
import 'package:flutter_guchi_memo/repository/shared_preference_repository.dart';
import 'package:flutter_guchi_memo/view_model/setting_page_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _settingProvider =
    StateNotifierProvider.autoDispose<SettingPageViewModel, Panti>(
  (ref) => SettingPageViewModel(
    ref.read(sharedPreferenceRepositoryProvider),
  ),
);

class SettingPage extends ConsumerWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final state = watch(_settingProvider);
    final viewModel = watch(_settingProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('設定'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: SwitchListTile(
              value: state.acrive,
              activeColor: Colors.pink,
              activeTrackColor: Colors.pink,
              inactiveThumbColor: Colors.grey,
              inactiveTrackColor: Colors.grey,
              secondary: const Icon(Icons.volume_up),
              title: const Text('パンチ音のON/OFF'),
              onChanged: (bool value) async {
                await viewModel.onCnaged(value: value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
