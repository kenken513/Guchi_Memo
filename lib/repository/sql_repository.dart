import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/guchi.dart';

final sqlRepositoryProvider = Provider<SqlRepository>(
  (_) => throw UnimplementedError(),
);

class SqlRepository {
  //_databaseを受け取る
  SqlRepository(this._database);
  final Future<Database> _database;

  //テーブル作成
  static Future<Database> get database async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'guchi.db');

    final database = openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          '''
CREATE TABLE guchi(id INTEGER PRIMARY KEY AUTOINCREMENT, text TEXT, content TEXT, createdAt TEXT, editedAt TEXT)''',
        );
      },
    );
    return database;
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
    final db = await _database;
    final List<Map<String, dynamic>> guchiList = await db.rawQuery('''
SELECT * FROM guchi ORDER BY id DESC LIMIT 20 OFFSET $offset
      ''');
    return guchiList.map((guchi) => Guchi.fromJson(guchi)).toList();
  }

//DBの愚痴を編集
  Future<void> updateGuchiDB(Guchi guchi) async {
    final db = await _database;
    await db.update(
      'guchi',
      guchi.toJson(),
      where: 'id = ?',
      whereArgs: [guchi.id!],
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
