import 'package:flutter/material.dart';
import 'package:flutter_guchi_memo/controllers/auth_controller/auth_controller.dart';
import 'package:flutter_guchi_memo/controllers/setting_controller/setting_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final state = watch(settingProvider);
    final settingController = watch(settingProvider.notifier);
    final authState = watch(authProvider);
    final canCheckBiometrics = authState.canCheckBiometrics;
    final active = state.active;
    final auth = state.authState;

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
                    await settingController.onCnaged(value: value);
                  },
                ),
              ),
            ),
            if (canCheckBiometrics)
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white70,
                  ),
                  child: SwitchListTile(
                    value: auth,
                    activeColor: Colors.pink,
                    activeTrackColor: Colors.pink,
                    inactiveThumbColor: Colors.grey,
                    inactiveTrackColor: Colors.grey,
                    secondary: const Icon(Icons.lock),
                    title: Text('画面ロック ${auth ? 'ON' : 'OFF'}'),
                    onChanged: (bool value) async {
                      await settingController.onCnagedAuthState(value: value);
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
                    state.version,
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
