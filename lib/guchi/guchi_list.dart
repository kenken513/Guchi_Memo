import 'package:flutter/material.dart';
import 'package:flutter_guchi_memo/guchi/guchi.dart';

class GuchiList extends ChangeNotifier {
  List<Guchi> guchiList = [];
  String title = '';
  String content = '';

//Guchiを追加する処理
  void addGuchi(String title, String content) {
    final id = guchiList.length + 1;
    final createDay = DateTime.now();
    final editDay = DateTime.now();
    guchiList =
        [...guchiList, Guchi(id, title, content, createDay, editDay)].toList();
    notifyListeners();
  }
}
