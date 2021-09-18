import 'package:flutter/material.dart';
import 'package:flutter_guchi_memo/controllers/auth_controller/auth_controller.dart';
import 'package:flutter_guchi_memo/controllers/setting_controller/setting_controller.dart';
import 'package:flutter_guchi_memo/repository/package_info_repository.dart';
import 'package:flutter_guchi_memo/repository/shared_preference_repository.dart';
import 'package:flutter_guchi_memo/repository/sql_repository.dart';
import 'package:flutter_guchi_memo/view/auth_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import 'view/guchi_home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  late final Database database;
  late final SharedPreferences sharedPreferences;
  late final PackageInfo packageInfo;

  await Future.wait([
    Future(() async {
      database = await SqlRepository.database;
    }),
    Future(() async {
      sharedPreferences = await SharedPreferences.getInstance();
    }),
    Future(() async {
      packageInfo = await PackageInfo.fromPlatform();
    }),
  ]);

  runApp(
    ProviderScope(
      overrides: [
        sqlRepositoryProvider.overrideWithValue(SqlRepository(database)),
        sharedPreferenceRepositoryProvider
            .overrideWithValue(SharedPreferenceRepository(sharedPreferences)),
        packageInfoRepositoryProvider
            .overrideWithValue(PackageInfoRepository(packageInfo)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final settingController = watch(settingProvider);
    final authState = settingController.authState;

    final auth = watch(authProvider);
    final isSignIn = auth.isSignIn;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '愚痴郎',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: authState
          ? isSignIn
              ? const GuchiHomePage()
              : const AuthPage()
          : const GuchiHomePage(),
    );
  }
}
