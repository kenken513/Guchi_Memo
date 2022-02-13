import 'package:flutter/material.dart';
import 'package:flutter_guchi_memo/controllers/biometrics_controller.dart';
import 'package:flutter_guchi_memo/controllers/fetch_app_version.dart';
import 'package:flutter_guchi_memo/controllers/setting_controller.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingPage extends HookConsumerWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final biometricsController = ref.watch(biometricsControllerProvider);
    final appVersion = ref.watch(fetchAppVersion);
    final canCheckBiometrics = useState(false);
    final isActiveSound = useState(true);
    final isLocked = useState(false);

    useEffect(() {
      Future(() async {
        canCheckBiometrics.value =
            await biometricsController.canCheckBiometrics;
        isActiveSound.value =
            await ref.read(settingControllerProvider).fetchIsSoundActive();
        isLocked.value =
            await ref.read(settingControllerProvider).fetchIsLocked();
      });
      return null;
    }, []);

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
                  value: isActiveSound.value,
                  activeColor: Colors.pink,
                  activeTrackColor: Colors.pink,
                  inactiveThumbColor: Colors.grey,
                  inactiveTrackColor: Colors.grey,
                  secondary: const Icon(Icons.volume_up),
                  title: Text('効果音 ${isActiveSound.value ? 'ON' : 'OFF'}'),
                  onChanged: (bool value) async {
                    isActiveSound.value = value;
                    await ref
                        .read(settingControllerProvider)
                        .setIsSoundActive(value: value);
                  },
                ),
              ),
            ),
            if (canCheckBiometrics.value)
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white70,
                  ),
                  child: SwitchListTile(
                    value: isLocked.value,
                    activeColor: Colors.pink,
                    activeTrackColor: Colors.pink,
                    inactiveThumbColor: Colors.grey,
                    inactiveTrackColor: Colors.grey,
                    secondary: const Icon(Icons.lock),
                    title: Text('画面ロック ${isLocked.value ? 'ON' : 'OFF'}'),
                    onChanged: (bool value) async {
                      isLocked.value = value;
                      await ref
                          .read(settingControllerProvider)
                          .setIsLocked(value: value);
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
                    appVersion,
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
