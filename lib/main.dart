import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_guchi_memo/controllers/setting_controller.dart';
import 'package:flutter_guchi_memo/repository/package_info_repository.dart';
import 'package:flutter_guchi_memo/repository/shared_preference_repository.dart';
import 'package:flutter_guchi_memo/repository/sql_repository.dart';
import 'package:flutter_guchi_memo/view/auth_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
    Firebase.initializeApp(),
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

final firebaseAnalyticsProvider =
    Provider<FirebaseAnalytics>((ref) => FirebaseAnalytics.instance);

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(settingProvider).authState;
    final analytics = ref.watch(firebaseAnalyticsProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '愚痴メモ',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: authState ? const AuthPage() : const GuchiHomePage(),
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
    );
  }
}
