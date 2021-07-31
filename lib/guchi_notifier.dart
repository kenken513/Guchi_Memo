import 'package:flutter_guchi_memo/guchi.dart';
import 'package:flutter_guchi_memo/guchi_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class GuchiNotifier extends StateNotifier<GuchiState> {
  GuchiNotifier() : super(const GuchiState(guchiList: []));

  Future<void> initializeGuchi() async {
    await getGuchisDB();
  }

//愚痴を作成
  Future<void> createGuchi(String text, String content, Guchi guchi) async {
    final id = state.guchiList.length + 1;
    final idToStr = id.toString();
    final createdAt = DateTime.now();
    final newList = [
      ...state.guchiList,
      Guchi(id: idToStr, text: text, content: content, createdAt: createdAt)
    ];
    state = state.copyWith(guchiList: newList);
    await insertGuchiDB(guchi);
  }

//愚痴を編集
  Future<void> updateGuchi(
    String id,
    String text,
    String content,
    Guchi guchi,
  ) async {
    final editedAt = DateTime.now();
    final newList = state.guchiList
        .map((guchi) => guchi.id == id
            ? Guchi(id: id, text: text, content: content, editedAt: editedAt)
            : guchi)
        .toList();
    state = state.copyWith(guchiList: newList);
    await updateGuchiDB(guchi);
  }

//愚痴を削除
  Future<void> deleteGuchi(
    String id,
  ) async {
    final newList = state.guchiList.where((guchi) => guchi.id != id).toList();
    state = state.copyWith(guchiList: newList);
    await deleteGuchiDB(id);
  }

  //テーブル作成
  Future<Database> get database async {
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
    final db = await database;
    await db.insert(
      'guchi',
      guchi.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

//DBから愚痴を取得
  Future<List<Guchi>> getGuchisDB() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('guchi');
    return maps
        .map((guchi) => Guchi(
              id: guchi['id'].toString(),
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
    final db = await database;
    await db.update(
      'guchi',
      guchi.toMap(),
      where: 'id = ?',
      whereArgs: [guchi.id],
      conflictAlgorithm: ConflictAlgorithm.fail,
    );
  }

//DBの愚痴を削除
  Future<void> deleteGuchiDB(String id) async {
    final db = await database;
    await db.delete(
      'guchi',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
