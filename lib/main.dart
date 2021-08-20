import 'package:flutter/material.dart';
import 'package:flutter_guchi_memo/repository/sql_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';

import 'view/guchi_home_page.dart';

Future<void> main() async {
  late final Database database;

  await Future.wait([
    Future(() async {
      database = SqlRepository(database).getDatabase();
    }),
  ]);

  runApp(
    ProviderScope(
      overrides: [
        sqlRepositoryProvider.overrideWithValue(database as SqlRepository),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo SQL',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const GuchiHomePage(),
    );
  }
}
