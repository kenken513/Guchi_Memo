import 'package:flutter/material.dart';
import 'package:flutter_guchi_memo/controllers/auth_controller.dart';
import 'package:flutter_guchi_memo/controllers/setting_controller.dart';
import 'package:flutter_guchi_memo/model/auth_state/auth_state.dart';
import 'package:flutter_guchi_memo/view/guchi_home_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthPage extends ConsumerWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingController = ref.watch(settingProvider);
    final authState = settingController.authState;

    ref.listen<AuthState>(
      authProvider,
      (previous, next) async {
        if (authState) {
          if (!next.isSignIn) {
            await Navigator.push<void>(
              context,
              MaterialPageRoute(
                builder: (context) => const AuthPage(),
              ),
            );
          }
        }
      },
    );

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 200,
          height: 50,
          child: ElevatedButton(
            onPressed: () async {
              final result =
                  await ref.read(authProvider.notifier).authenticate();
              if (result) {
                await Navigator.push<void>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GuchiHomePage(),
                  ),
                );
                ref.read(authProvider.notifier).changeIsSignIn();
              }
            },
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'ロックを解除',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(Icons.lock_open),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
