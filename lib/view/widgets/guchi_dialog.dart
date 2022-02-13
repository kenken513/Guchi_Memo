import 'package:flutter/material.dart';
import 'package:flutter_guchi_memo/controllers/guchi_controller.dart';
import 'package:flutter_guchi_memo/controllers/sound_action.dart';
import 'package:flutter_guchi_memo/model/guchi/guchi.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GuchiDialog extends HookConsumerWidget {
  const GuchiDialog({Key? key, this.id, this.guchi}) : super(key: key);

  final int? id;

  final Guchi? guchi;

  static Future<void> show(BuildContext context,
      {int? id, Guchi? guchi}) async {
    await showDialog<Widget>(
      context: context,
      builder: (_) => GuchiDialog(id: id, guchi: guchi),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final guchiController = ref.watch(guchiProvider.notifier);
    final titleTextEditingController =
        useState(TextEditingController(text: guchi?.text));
    final contentTextEditingController =
        useState(TextEditingController(text: guchi?.content));

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
                  await ref.read(soundAction).soundActionOnChange();
                },
                controller: titleTextEditingController.value,
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
                  await ref.read(soundAction).soundActionOnChange();
                },
                controller: contentTextEditingController.value,
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
                      titleTextEditingController.value.text,
                      contentTextEditingController.value.text,
                    );
                    titleTextEditingController.value.clear();
                    contentTextEditingController.value.clear();

                    await ref.read(soundAction).soundAction();

                    Navigator.pop(context);
                    return;
                  }
                  await guchiController.createGuchi(
                    titleTextEditingController.value.text,
                    contentTextEditingController.value.text,
                  );
                  titleTextEditingController.value.clear();
                  contentTextEditingController.value.clear();

                  await ref.read(soundAction).soundAction();

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
