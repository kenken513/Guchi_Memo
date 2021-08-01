import 'package:flutter/material.dart';
import 'package:flutter_guchi_memo/guchi.dart';
import 'package:flutter_guchi_memo/guchi_notifier.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class GuchiPage extends ConsumerWidget {
  const GuchiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final guchi = watch(guchiProvider);
    final notifier = watch(guchiProvider.notifier);
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
                                controller: notifier.titleController,
                              ),
                              TextField(
                                  decoration: const InputDecoration(
                                    labelText: '詳しく教えて！',
                                    hintText: '愚痴れ！',
                                  ),
                                  controller: notifier.contentController),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: ElevatedButton(
                                  onPressed: () async {
                                    await notifier.updateGuchi(
                                      guchi.guchiList[index].id!,
                                      notifier.titleController.text,
                                      notifier.contentController.text,
                                      Guchi(
                                          text: notifier.titleController.text,
                                          content:
                                              notifier.contentController.text,
                                          editedAt: DateTime.now()),
                                    );
                                    notifier.titleController.clear();
                                    notifier.contentController.clear();
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
                            controller: notifier.titleController),
                        TextField(
                            decoration: const InputDecoration(
                              labelText: '詳しく教えて！',
                              hintText: '愚痴れ！',
                            ),
                            controller: notifier.contentController),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: ElevatedButton(
                            onPressed: () async {
                              await notifier.createGuchi(
                                  notifier.titleController.text,
                                  notifier.contentController.text,
                                  Guchi(
                                    text: notifier.titleController.text,
                                    content: notifier.contentController.text,
                                    createdAt: DateTime.now(),
                                  ));
                              notifier.titleController.clear();
                              notifier.contentController.clear();
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
