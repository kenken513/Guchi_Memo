import 'package:flutter/material.dart';
import 'package:flutter_guchi_memo/controllers/start_up_guide_dialog_controller.dart';
import 'package:flutter_guchi_memo/view/dialog/guchi_dialog.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StartUpGuideDialog extends ConsumerWidget {
  const StartUpGuideDialog({Key? key}) : super(key: key);

  static Future<void> show(BuildContext context) async {
    await showDialog<Widget>(
      context: context,
      builder: (_) => const StartUpGuideDialog(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final startUpGuideDialogController = ref.watch(startUpGuideDialogProvider);
    return AlertDialog(
      title: const Center(
          child: Text(
        '愚痴メモとは',
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      content: SingleChildScrollView(
        child: Column(
          children: [
            const Text('愚痴を作成し発散するアプリです!'),
            const Text('作成時に効果音やバイブレーションで爽快感を感じることが出来ます!'),
            const Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text(
                '早速愚痴ってみましょう！',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () async {
                    Navigator.of(context).pop();

                    await startUpGuideDialogController.setStartUpGuideState();

                    await GuchiDialog.show(context);
                  },
                  child: const Text(
                    '愚痴る',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
