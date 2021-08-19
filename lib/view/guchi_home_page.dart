import 'package:flutter/material.dart';
import 'package:flutter_guchi_memo/model/guchi_state.dart';
import 'package:flutter_guchi_memo/repository/sql_repository.dart';
import 'package:flutter_guchi_memo/view_model/guchi_home_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

final _guchiProvider = StateNotifierProvider<GuchiHomeViewModel, GuchiState>(
  (ref) => GuchiHomeViewModel(
    ref.read(sqlRepositoryProvider),
  ),
);

class GuchiHomePage extends ConsumerWidget {
  const GuchiHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final guchi = watch(_guchiProvider);
    final _viewModel = watch(_guchiProvider.notifier);
    return Scaffold(
      appBar: AppBar(),
      body: SmartRefresher(
        enablePullDown: false,
        enablePullUp: true,
        controller: _viewModel.refreshController,
        onLoading: _viewModel.onLoading,
        child: ListView.builder(
            itemCount: guchi.guchiList.length,
            itemBuilder: (context, index) {
              final data = guchi.guchiList[index];
              return ListTile(
                leading: Text(data.id.toString()),
                // const Icon(Icons.book),
                title: Text(data.text.toString()),
                subtitle: Text(data.content.toString()),
                trailing: IconButton(
                  onPressed: () {
                    if (data.id != null) {
                      _viewModel.deleteGuchi(data.id!);
                    }
                  },
                  icon: const Icon(Icons.delete),
                ),
                onLongPress: () {
                  showDialog<Widget>(
                      context: context,
                      builder: (_) => AlertDialog(
                            title: const Text('愚痴れ！'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                TextField(
                                  decoration: const InputDecoration(
                                    labelText: '愚痴を教えて！',
                                    hintText: '愚痴れ！',
                                  ),
                                  controller: _viewModel.titleController,
                                ),
                                TextField(
                                    decoration: const InputDecoration(
                                      labelText: '詳しく教えて！',
                                      hintText: '愚痴れ！',
                                    ),
                                    controller: _viewModel.contentController),
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      if (data.id != null) {
                                        await _viewModel.updateGuchi(
                                          data.id!,
                                          _viewModel.titleController.text,
                                          _viewModel.contentController.text,
                                        );

                                        await _viewModel.soundAction();
                                      }
                                      _viewModel.titleController.clear();
                                      _viewModel.contentController.clear();

                                      Navigator.pop(context);
                                    },
                                    child: const Text('編集'),
                                  ),
                                ),
                              ],
                            ),
                          ));
                },
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog<Widget>(
              context: context,
              builder: (_) => AlertDialog(
                    title: const Text('愚痴れ！'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextField(
                          decoration: const InputDecoration(
                            labelText: '愚痴を教えて！',
                            hintText: '愚痴れ！',
                          ),
                          controller: _viewModel.titleController,
                        ),
                        TextField(
                          decoration: const InputDecoration(
                            labelText: '詳しく教えて！',
                            hintText: '愚痴れ！',
                          ),
                          controller: _viewModel.contentController,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: ElevatedButton(
                            onPressed: () async {
                              await _viewModel.createGuchi(
                                _viewModel.titleController.text,
                                _viewModel.contentController.text,
                              );
                              _viewModel.titleController.clear();
                              _viewModel.contentController.clear();

                              await _viewModel.soundAction();

                              Navigator.pop(context);
                            },
                            child: const Text('保存'),
                          ),
                        ),
                      ],
                    ),
                  ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
