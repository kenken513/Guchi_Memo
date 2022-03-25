import 'package:flutter/material.dart';
import 'package:flutter_guchi_memo/controllers/biometrics_controller.dart';
import 'package:flutter_guchi_memo/controllers/fetch_app_version.dart';
import 'package:flutter_guchi_memo/controllers/setting_controller.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingPage extends HookConsumerWidget {
  const SettingPage({Key? key}) : super(key: key);

  static Future<void> show(BuildContext context) async {
    await Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (context) => const SettingPage(),
      ),
    );
  }

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
            ref.read(settingControllerProvider).fetchIsSoundActive;
        isLocked.value = ref.read(settingControllerProvider).fetchIsLocked;
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
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white70,
                ),
                child: SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Icon(
                                Icons.volume_up,
                                color: isActiveSound.value
                                    ? Colors.pink
                                    : Colors.grey,
                              ),
                            ),
                            Text('効果音 ${isActiveSound.value ? 'ON' : 'OFF'}'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Switch(
                          value: isActiveSound.value,
                          onChanged: (bool value) async {
                            isActiveSound.value = value;
                            await ref
                                .read(settingControllerProvider)
                                .setIsSoundActive(value: value);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (canCheckBiometrics.value)
              Padding(
                padding: const EdgeInsets.all(8),
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white70,
                  ),
                  child: SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: Icon(
                                  Icons.lock,
                                  color: isLocked.value
                                      ? Colors.pink
                                      : Colors.grey,
                                ),
                              ),
                              Text('画面ロック ${isLocked.value ? 'ON' : 'OFF'}'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Switch(
                            value: isLocked.value,
                            onChanged: (bool value) async {
                              isLocked.value = value;
                              await ref
                                  .read(settingControllerProvider)
                                  .setIsLocked(value: value);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white70,
                ),
                child: SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Text('アプリバージョン'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 28),
                        child: Text(
                          appVersion,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
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
