// import 'dart:core';
// import 'package:flutter/material.dart';
// import 'package:flutter_guchi_memo/guchi/guchi.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// class GuchiList extends ChangeNotifier {
//   List<Guchi> guchiList = [];
//   String title = '';
//   String content = '';
//   late Guchi guchi;
//   late Database dataBase;

// //データベースを作成
//   Future<Database> get database async {
//     final database = openDatabase(
//       join(await getDatabasesPath(), 'guchi.db'),
//       onCreate: (db, version) {
//         return db.execute(
//           '''
// CREATE TABLE guchi(id INTEGER PRIMARY KEY 
//AUTOINCREMENT, guchiId TEXT, title TEXT, content
// TEXT, createDay TEXT, editDay TEXT)''',
//         );
//       },
//       version: 1,
//     );
//     return database;
//   }

//データをインサート
  // Future<void> insertGuchi(Guchi guchi) async {
  //   final db = await database;
  //   await db.insert('guchi', guchi.toMap(),
  //       conflictAlgorithm: ConflictAlgorithm.replace);
  //   notifyListeners();
  // }

  // Future<List<Guchi>> getGuchi() async {
  //   final db = await database;
  //   final List<Map<String, dynamic>> maps = await db.query('guchi');

  // }

//データをインサート
//   Future insertGuchi(String title, String content) async {
//     final id = guchiList.length + 1;
//     final createDay = DateTime.now().toString;
//     final editDay = DateTime.now().toString;

//     await dataBase.rawInsert('''
// INSERT INTO guchi(guchiId,title,content,
//createDay,editDay) VALUES($id,$title,$content,$createDay,$editDay)
// ''');
//   }

  // Future<List<Guchi>> getGuchi() async {
  //   List<Map> list = await dataBase.rawQuery('SELECT * FROM guchi');
  //   return list.map((Map m) {
  //   String guchiId = m['guchiId'],
  //   String title = m['title'],
  //   String content = m['content'],
  //   String createDay = m['createDay'],
  //   String editDay = m['editDay'],
  //   }).toList();
  // }

//Guchiを追加する処理
  // void addGuchi(String title, String content) {
  //   final id = guchiList.length + 1;
  //   final createDay = DateTime.now();
  //   final editDay = DateTime.now();
  //   guchiList =
  //       [...guchiList, Guchi(id, 
  //title, content, createDay, editDay)].toList();
  //   notifyListeners();
  // }

//Guchiを編集する処理
  // void upDateGuchi(int id, String title, String content) {
  //   guchiList.asMap().forEach((int index, Guchi guchi) {
  //     if (guchi.id == id) {
  //       guchiList[index].title = title;
  //       guchiList[index].content = content;
  //       guchiList[index].editDay = DateTime.now();
  //     }
  //   });
  //   notifyListeners();
  // }

//Guchiを削除する処理
  // void delteGuchi(int id) {
  //   guchiList = guchiList.where((guchi) => guchi.id != id).toList();
  //   notifyListeners();
  // }
// }
