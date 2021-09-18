import 'package:flutter/material.dart';
import 'package:flutter_guchi_memo/controllers/auth_controller/auth_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthPage extends ConsumerWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final authController = watch(authProvider.notifier);
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 200,
          height: 50,
          child: ElevatedButton(
            onPressed: () async {
              await authController.authenticate();
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
