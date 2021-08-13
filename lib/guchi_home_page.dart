import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_guchi_memo/audio_file.dart';
import 'package:flutter_guchi_memo/guchi_home_view_model.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class GuchiHomePage extends ConsumerWidget {
  const GuchiHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final guchi = watch(guchiProvider);
    final viewModel = watch(guchiProvider.notifier);
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: guchi.guchiList.length,
          itemBuilder: (context, index) {
            final data = guchi.guchiList[index];
            return ListTile(
              leading: const Icon(Icons.book),
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

                                      await viewModel.audioCache.play(
                                        AudioFile.panti.value,
                                      );

                                      await HapticFeedback.heavyImpact();
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

                              await viewModel.audioCache.play(
                                AudioFile.panti.value,
                              );

                              await HapticFeedback.heavyImpact();

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
