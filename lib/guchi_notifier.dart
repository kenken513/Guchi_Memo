import 'package:flutter/material.dart';
import 'package:flutter_guchi_memo/guchi.dart';
import 'package:flutter_guchi_memo/guchi_state.dart';
import 'package:flutter_guchi_memo/repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final guchiProvider = StateNotifierProvider<GuchiHomeViewModel, GuchiState>(
  (ref) => GuchiHomeViewModel(),
);

class GuchiHomeViewModel extends StateNotifier<GuchiState> {
  GuchiHomeViewModel() : super(const GuchiState()) {
    initializeGuchi();
  }

  final titleController = TextEditingController();
  final contentController = TextEditingController();

//初期化
  Future<void> initializeGuchi() async {
    final listDB = await SqlRepository().getGuchisDB();
    state = state.copyWith(guchiList: listDB);
  }

//愚痴を作成
  Future<void> createGuchi(
    String text,
    String content,
  ) async {
    final createdAt = DateTime.now();
    final editedAt = DateTime.now();

    final guchi = Guchi(
      text: text,
      content: content,
      createdAt: createdAt,
      editedAt: editedAt,
    );

    await SqlRepository().insertGuchiDB(guchi);

    final latestGuchiListDB =
        await SqlRepository().getLatestGuchiDB(createdAt.toIso8601String());

    final newlist = [...state.guchiList, ...latestGuchiListDB];
    state = state.copyWith(guchiList: newlist);
  }

//愚痴を編集
  Future<void> updateGuchi(
    int id,
    String text,
    String content,
  ) async {
    final editedAt = DateTime.now();
    final updateGuchi = state.guchiList
        .firstWhere((guchi) => guchi.id == id)
        .copyWith(text: text, content: content, editedAt: editedAt);
    final newList = state.guchiList
        .map((guchi) => guchi.id == id ? updateGuchi : guchi)
        .toList();
    await SqlRepository().updateGuchiDB(updateGuchi);
    state = state.copyWith(guchiList: newList);
  }

//愚痴を削除
  Future<void> deleteGuchi(
    int id,
  ) async {
    final newList = state.guchiList.where((guchi) => guchi.id != id).toList();
    state = state.copyWith(guchiList: newList);
    await SqlRepository().deleteGuchiDB(id);
  }
}
