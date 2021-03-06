import 'package:flutter_guchi_memo/model/guchi/guchi.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final sqlRepositoryProvider = Provider<SqlRepository>(
  (_) => throw UnimplementedError(),
);

class SqlRepository {
  //_databaseを受け取る
  SqlRepository(this._database);
  final Database _database;

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
    final db = _database;
    await db.insert(
      'guchi',
      guchi.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

//DBから最新の愚痴を取得
  Future<Guchi?> fetchLatestGuchiDB() async {
    final db = _database;
    final latestGuchi = await db.rawQuery('''
SELECT * FROM guchi ORDER BY id DESC LIMIT 1
      ''');
    final guchi = latestGuchi.map((guchi) => Guchi.fromJson(guchi)).toList();
    return guchi.first;
  }

  //スクロール時にDBから愚痴20件を取得する
  Future<List<Guchi>> fetchGuchiList({int offset = 0}) async {
    final db = _database;
    final guchiList = await db.rawQuery('''
SELECT * FROM guchi ORDER BY id DESC LIMIT 20 OFFSET $offset
      ''');
    return guchiList.map((guchi) => Guchi.fromJson(guchi)).toList();
  }

//DBの愚痴を編集
  Future<void> updateGuchiDB(Guchi guchi) async {
    final db = _database;
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
    final db = _database;
    await db.delete(
      'guchi',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
