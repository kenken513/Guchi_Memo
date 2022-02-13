import 'package:flutter/material.dart';
import 'package:flutter_guchi_memo/controllers/guchi_controller.dart';
import 'package:flutter_guchi_memo/view/setting_page.dart';
import 'package:flutter_guchi_memo/view/widgets/guchi_dialog.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class GuchiHomePage extends HookConsumerWidget {
  const GuchiHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(guchiProvider);
    final guchiController = ref.watch(guchiProvider.notifier);
    final refreshController =
        useState(RefreshController(initialRefresh: false));

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('愚痴メモ'),
        actions: [
          IconButton(
            onPressed: () async {
              await SettingPage.show(context);
            },
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: SmartRefresher(
        enablePullDown: false,
        enablePullUp: true,
        controller: refreshController.value,
        onLoading: guchiController.onLoading,
        child: ListView.builder(
            itemCount: state.guchiList.length,
            itemBuilder: (context, index) {
              final data = state.guchiList[index];
              return Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.pink, width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                  ),
                  child: ListTile(
                    title: Text(
                      data.text,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      data.content,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        if (data.id != null) {
                          guchiController.deleteGuchi(data.id!);
                        }
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.black,
                      ),
                    ),
                    onLongPress: () async {
                      await GuchiDialog.show(context, id: data.id, guchi: data);
                    },
                  ),
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await GuchiDialog.show(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
