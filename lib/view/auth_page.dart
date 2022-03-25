import 'package:flutter/material.dart';
import 'package:flutter_guchi_memo/controllers/auth_controller.dart';
import 'package:flutter_guchi_memo/controllers/biometrics_controller.dart';
import 'package:flutter_guchi_memo/view/guchi_home_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthPage extends HookConsumerWidget {
  const AuthPage({Key? key}) : super(key: key);

  static Future<void> show(BuildContext context) async {
    await Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (context) => const AuthPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Center(
          child: SizedBox(
            width: 200,
            height: 50,
            child: ElevatedButton(
              onPressed: () async {
                final result = await ref
                    .read(biometricsControllerProvider)
                    .didAuthenticate();
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
      ),
    );
  }
}
