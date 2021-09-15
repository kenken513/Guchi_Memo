import 'package:flutter/material.dart';
import 'package:flutter_guchi_memo/view/setting_page.dart';
import 'package:flutter_guchi_memo/controllers/guchi_controller/guchi_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class GuchiHomePage extends ConsumerWidget {
  const GuchiHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final state = watch(guchiProvider);
    final guchiController = watch(guchiProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('愚痴郎'),
        actions: [
          IconButton(
            onPressed: () async {
              await Navigator.push<void>(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingPage(),
                ),
              ).then((value) async {
                await guchiController.updateActive();
              });
            },
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: SmartRefresher(
        enablePullDown: false,
        enablePullUp: true,
        controller: guchiController.refreshController,
        onLoading: guchiController.onLoading,
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
                      guchiController.deleteGuchi(data.id!);
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
                                  controller: guchiController.titleController,
                                ),
                                TextField(
                                    decoration: const InputDecoration(
                                      labelText: '詳しく教えて！',
                                      hintText: '愚痴れ！',
                                    ),
                                    controller:
                                        guchiController.contentController),
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      if (data.id != null) {
                                        await guchiController.updateGuchi(
                                          data.id!,
                                          guchiController.titleController.text,
                                          guchiController
                                              .contentController.text,
                                        );

                                        await guchiController.soundAction();
                                      }
                                      guchiController.titleController.clear();
                                      guchiController.contentController.clear();

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
                          controller: guchiController.titleController,
                        ),
                        TextField(
                          decoration: const InputDecoration(
                            labelText: '詳しく教えて！',
                            hintText: '愚痴れ！',
                          ),
                          controller: guchiController.contentController,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: ElevatedButton(
                            onPressed: () async {
                              await guchiController.createGuchi(
                                guchiController.titleController.text,
                                guchiController.contentController.text,
                              );
                              guchiController.titleController.clear();
                              guchiController.contentController.clear();

                              await guchiController.soundAction();

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
