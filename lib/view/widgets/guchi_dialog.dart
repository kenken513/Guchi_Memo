import 'package:flutter/material.dart';
import 'package:flutter_guchi_memo/controllers/guchi_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GuchiDialog extends ConsumerWidget {
  GuchiDialog({Key? key, this.id}) : super(key: key);
  int? id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final guchiController = ref.watch(guchiProvider.notifier);

    return AlertDialog(
      title: const Center(
          child: Text(
        '愚痴れ！',
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: '愚痴を教えて！',
                  hintText: '愚痴れ！',
                ),
                onChanged: (text) async {
                  await guchiController.soundActionOnChange();
                },
                controller: guchiController.titleController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                minLines: 4,
                decoration: const InputDecoration(
                  labelText: '詳しく教えて！',
                  hintText: '愚痴れ！',
                ),
                onChanged: (text) async {
                  await guchiController.soundActionOnChange();
                },
                controller: guchiController.contentController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () async {
                  if (id != null) {
                    await guchiController.updateGuchi(
                      id!,
                      guchiController.titleController.text,
                      guchiController.contentController.text,
                    );
                  } else {
                    await guchiController.createGuchi(
                      guchiController.titleController.text,
                      guchiController.contentController.text,
                    );
                  }

                  guchiController.titleController.clear();
                  guchiController.contentController.clear();

                  await guchiController.soundAction();

                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    id != null ? '編集' : '保存',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
