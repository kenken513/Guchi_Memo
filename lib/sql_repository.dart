import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'guchi.dart';

final sqlRepositoryProvider = Provider<SqlRepository>(
  (_) => SqlRepository(),
);

class SqlRepository {
  //テーブル作成
  static Future<Database> get _database async {
    final _database = openDatabase(
      join(await getDatabasesPath(), 'guchi_database.db'),
      onCreate: (db, version) {
        return db.execute(
          '''
CREATE TABLE guchi(id INTEGER PRIMARY KEY AUTOINCREMENT, text TEXT, content TEXT, createdAt TEXT, editedAt TEXT)''',
        );
      },
      version: 1,
    );
    return _database;
  }

//DBに愚痴を追加
  Future<void> insertGuchiDB(Guchi guchi) async {
    final db = await _database;
    await db.insert(
      'guchi',
      guchi.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

//DBから最新の愚痴を取得
  Future<List<Guchi>> fetchLatestGuchiDB() async {
    final db = await _database;
    final List<Map<String, dynamic>> latestGuchi = await db.rawQuery('''
SELECT * FROM guchi ORDER BY id DESC LIMIT 1
      ''');
    return latestGuchi.map((guchi) => Guchi.fromJson(guchi)).toList();
  }

  //スクロール時にDBから愚痴20件を取得する
  Future<List<Guchi>> fetchGuchiList({int offset = 0}) async {
    final length = offset;
    final db = await _database;
    final List<Map<String, dynamic>> latestGuchi = await db.rawQuery('''
SELECT * FROM guchi LIMIT 20 OFFSET $length
      ''');
    return latestGuchi.map((guchi) => Guchi.fromJson(guchi)).toList();
  }

//DBの愚痴を編集
  Future<void> updateGuchiDB(Guchi guchi) async {
    final db = await _database;
    await db.update(
      'guchi',
      guchi.toJson(),
      where: 'id = ?',
      whereArgs: [guchi.id],
      conflictAlgorithm: ConflictAlgorithm.fail,
    );
  }

//DBの愚痴を削除
  Future<void> deleteGuchiDB(int id) async {
    final db = await _database;
    await db.delete(
      'guchi',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
