import 'package:flutter/material.dart';

import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class Guchi {
  Guchi({this.id, this.text, this.content, this.createdAt, this.editedAt});
  final String? id;
  final String? text;
  final String? content;
  final String? createdAt;
  final String? editedAt;

  Map<String, dynamic> toMap() {
    final map = {
      'id': id,
      'text': text,
      'content': content,
      'createdAt': createdAt,
      'editedAt': editedAt,
    };
    return map;
  }

  static Future<Database> get database async {
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

  static Future<void> insertGuchi(Guchi guchi) async {
    final db = await database;
    await db.insert(
      'guchi',
      guchi.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Guchi>> getGuchis() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('guchi');
    return List.generate(maps.length, (i) {
      return Guchi(
        id: maps[i]['id'].toString(),
        text: maps[i]['text'].toString(),
        content: maps[i]['content'].toString(),
        createdAt: maps[i]['createdAt'].toString(),
        editedAt: maps[i]['editedAt'].toString(),
      );
    });
  }

  static Future<void> updateGuchi(Guchi guchi) async {
    final db = await database;
    await db.update(
      'guchi',
      guchi.toMap(),
      where: 'id = ?',
      whereArgs: [guchi.id],
      conflictAlgorithm: ConflictAlgorithm.fail,
    );
  }

  static Future<void> deleteGuchi(String id) async {
    final db = await database;
    await db.delete(
      'guchi',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

void main() {
  runApp(const MyApp());
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

class GuchiHomePage extends StatefulWidget {
  const GuchiHomePage({Key? key}) : super(key: key);
  @override
  _GuchiHomePageState createState() => _GuchiHomePageState();
}

class _GuchiHomePageState extends State<GuchiHomePage> {
  List<Guchi> _memoList = [];
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final upDateController = TextEditingController();

  Future<void> initializeDemo() async {
    _memoList = await Guchi.getGuchis();
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GuchiRO'),
      ),
      body: Container(
        padding: const EdgeInsets.all(32),
        child: FutureBuilder(
          future: initializeDemo(),
          builder: (context, snapshot) {
            return ListView.builder(
              itemCount: _memoList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Text(
                    'GUchi',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: Text(_memoList[index].text.toString()),
                  subtitle: Text(_memoList[index].content.toString()),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () async {
                      await Guchi.deleteGuchi(_memoList[index].id!);
                      final memos = await Guchi.getGuchis();
                      setState(() {
                        _memoList = memos;
                      });
                    },
                  ),
                  onLongPress: () async {
                    await showDialog<Widget>(
                        context: context,
                        builder: (_) => AlertDialog(
                              title: const Text('愚痴れ！'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  TextField(controller: titleController),
                                  TextField(controller: contentController),
                                  ElevatedButton(
                                    onPressed: () async {
                                      final _upDate = Guchi(
                                        id: _memoList[index].id,
                                        text: titleController.text,
                                        content: contentController.text,
                                        editedAt: DateTime.now().toString(),
                                      );
                                      await Guchi.updateGuchi(_upDate);
                                      final memos = await Guchi.getGuchis();
                                      setState(() {
                                        _memoList = memos;
                                      });
                                      setState(() {
                                        _memoList = memos;
                                      });
                                      titleController.clear();
                                      contentController.clear();
                                      Navigator.pop(context);
                                    },
                                    child: const Text('編集'),
                                  ),
                                ],
                              ),
                            ));
                  },
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: Column(
        verticalDirection: VerticalDirection.up,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              showDialog<Widget>(
                  context: context,
                  builder: (_) => AlertDialog(
                        title: const Text('愚痴れ！'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            TextField(controller: titleController),
                            TextField(controller: contentController),
                            ElevatedButton(
                              onPressed: () async {
                                final _memo = Guchi(
                                  text: titleController.text,
                                  content: contentController.text,
                                  createdAt: DateTime.now().toString(),
                                );
                                await Guchi.insertGuchi(_memo);
                                final memos = await Guchi.getGuchis();
                                setState(() {
                                  _memoList = memos;
                                });
                                titleController.clear();
                                contentController.clear();
                                Navigator.pop(context);
                              },
                              child: const Text('保存'),
                            ),
                          ],
                        ),
                      ));
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
