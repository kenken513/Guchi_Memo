import 'package:flutter/material.dart';
import 'package:flutter_guchi_memo/model/guchi_state.dart';
import 'package:flutter_guchi_memo/repository/sql_repository.dart';
import 'package:flutter_guchi_memo/view_model/guchi_home_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

final _guchiProvider =
    StateNotifierProvider.autoDispose<GuchiHomeViewModel, GuchiState>(
  (ref) => GuchiHomeViewModel(
    ref.read(sqlRepositoryProvider),
  ),
);

class GuchiHomePage extends ConsumerWidget {
  const GuchiHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final state = watch(_guchiProvider);
    final viewModel = watch(_guchiProvider.notifier);
    return Scaffold(
      appBar: AppBar(),
      body: SmartRefresher(
        enablePullDown: false,
        enablePullUp: true,
        controller: viewModel.refreshController,
        onLoading: viewModel.onLoading,
        child: ListView.builder(
            itemCount: state.guchiList.length,
            itemBuilder: (context, index) {
              final data = state.guchiList[index];
              return ListTile(
                leading: Text(data.id.toString()),
                // const Icon(Icons.book),
                title: Text(data.text.toString()),
                subtitle: Text(data.content.toString()),
                trailing: IconButton(
                  onPressed: () {
                    if (data.id != null) {
                      viewModel.deleteGuchi(data.id!);
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
                                  controller: viewModel.titleController,
                                ),
                                TextField(
                                    decoration: const InputDecoration(
                                      labelText: '詳しく教えて！',
                                      hintText: '愚痴れ！',
                                    ),
                                    controller: viewModel.contentController),
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      if (data.id != null) {
                                        await viewModel.updateGuchi(
                                          data.id!,
                                          viewModel.titleController.text,
                                          viewModel.contentController.text,
                                        );

                                        await viewModel.soundAction();
                                      }
                                      viewModel.titleController.clear();
                                      viewModel.contentController.clear();

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
                          controller: viewModel.titleController,
                        ),
                        TextField(
                          decoration: const InputDecoration(
                            labelText: '詳しく教えて！',
                            hintText: '愚痴れ！',
                          ),
                          controller: viewModel.contentController,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: ElevatedButton(
                            onPressed: () async {
                              await viewModel.createGuchi(
                                viewModel.titleController.text,
                                viewModel.contentController.text,
                              );
                              viewModel.titleController.clear();
                              viewModel.contentController.clear();

                              await viewModel.soundAction();

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
