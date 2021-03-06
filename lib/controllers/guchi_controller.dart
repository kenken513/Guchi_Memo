import 'package:flutter_guchi_memo/model/guchi/guchi.dart';
import 'package:flutter_guchi_memo/model/guchi/guchi_state.dart';
import 'package:flutter_guchi_memo/repository/sql_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final guchiProvider = StateNotifierProvider<GuchiController, GuchiState>(
  (ref) => GuchiController(
    ref.read,
  ),
);

class GuchiController extends StateNotifier<GuchiState> {
  GuchiController(this._read) : super(const GuchiState());

  final Reader _read;

  SqlRepository get _sqlRepository => _read(sqlRepositoryProvider);

  Future<void> onLoading() async {
    final listLength = state.guchiList.length;
    final listDB = await _sqlRepository.fetchGuchiList(offset: listLength);
    final newList = [...state.guchiList, ...listDB];
    state = state.copyWith(guchiList: newList);
  }

//初期化
  Future<void> initializeGuchi() async {
    final listDB = await _sqlRepository.fetchGuchiList();
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

    await _sqlRepository.insertGuchiDB(guchi);

    final latestGuchiListDB = await _sqlRepository.fetchLatestGuchiDB();

    final newlist = [
      latestGuchiListDB!,
      ...state.guchiList,
    ];
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
    await _sqlRepository.updateGuchiDB(updateGuchi);
    state = state.copyWith(guchiList: newList);
  }

//愚痴を削除
  Future<void> deleteGuchi(
    int id,
  ) async {
    final newList = state.guchiList.where((guchi) => guchi.id != id).toList();
    state = state.copyWith(guchiList: newList);
    await _sqlRepository.deleteGuchiDB(id);
  }
}
