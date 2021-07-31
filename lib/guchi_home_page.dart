import 'package:flutter/material.dart';
import 'package:flutter_guchi_memo/guchi.dart';
import 'package:flutter_guchi_memo/guchi_notifier.dart';
import 'package:flutter_guchi_memo/guchi_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GuchiPage extends ConsumerWidget {
  GuchiPage({Key? key}) : super(key: key);
  final guchiProvider = StateNotifierProvider<GuchiNotifier, GuchiState>(
      (ref) => GuchiNotifier());
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final guchi = watch(guchiProvider);
    final notifier = watch(guchiProvider.notifier);
    final titleController = TextEditingController();
    final contentController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: guchi.guchiList.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const Icon(Icons.book),
              title: Text(guchi.guchiList[index].text.toString()),
              subtitle: Text(guchi.guchiList[index].content.toString()),
              trailing: IconButton(
                onPressed: () {
                  notifier.deleteGuchi(guchi.guchiList[index].id!);
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
                                controller: titleController,
                              ),
                              TextField(
                                  decoration: const InputDecoration(
                                    labelText: '詳しく教えて！',
                                    hintText: '愚痴れ！',
                                  ),
                                  controller: contentController),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: ElevatedButton(
                                  onPressed: () async {
                                    await notifier.updateGuchi(
                                      guchi.guchiList[index].id!,
                                      titleController.text,
                                      contentController.text,
                                      Guchi(
                                          text: titleController.text,
                                          content: contentController.text,
                                          editedAt: DateTime.now()),
                                    );
                                    titleController.clear();
                                    contentController.clear();
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
                            controller: titleController),
                        TextField(
                            decoration: const InputDecoration(
                              labelText: '詳しく教えて！',
                              hintText: '愚痴れ！',
                            ),
                            controller: contentController),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: ElevatedButton(
                            onPressed: () async {
                              await notifier.createGuchi(
                                  titleController.text,
                                  contentController.text,
                                  Guchi(
                                    text: titleController.text,
                                    content: contentController.text,
                                    createdAt: DateTime.now(),
                                  ));
                              titleController.clear();
                              contentController.clear();
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
