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

//DBから愚痴を取得
  Future<List<Guchi>> getGuchisDB() async {
    final db = await _database;
    final List<Map<String, dynamic>> maps = await db.query('guchi');
    return maps
        .map((guchi) => Guchi(
              id: int.parse(guchi['id'].toString()),
              text: guchi['text'].toString(),
              content: guchi['content'].toString(),
              createdAt: guchi['createdAt'] != null
                  ? DateTime.parse(guchi['createdAt'].toString()).toLocal()
                  : null,
              editedAt: guchi['editedAt'] != null
                  ? DateTime.parse(guchi['editedAt'].toString()).toLocal()
                  : null,
            ))
        .toList();
  }

//DBから最新の愚痴を取得
  Future<List<Guchi>> getLatestGuchiDB() async {
    final db = await _database;
    final List<Map<String, dynamic>> latestGuchi = await db.rawQuery('''
SELECT * FROM guchi ORDER BY id DESC LIMIT 1
      ''');
    return latestGuchi
        .map((guchi) => Guchi(
              id: int.parse(guchi['id'].toString()),
              text: guchi['text'].toString(),
              content: guchi['content'].toString(),
              createdAt: guchi['createdAt'] != null
                  ? DateTime.parse(guchi['createdAt'].toString()).toLocal()
                  : null,
              editedAt: guchi['editedAt'] != null
                  ? DateTime.parse(guchi['editedAt'].toString()).toLocal()
                  : null,
            ))
        .toList();
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
