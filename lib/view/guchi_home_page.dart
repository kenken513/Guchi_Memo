import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_guchi_memo/controllers/guchi_controller.dart';
import 'package:flutter_guchi_memo/controllers/modal_controller.dart';
import 'package:flutter_guchi_memo/view/setting_page.dart';
import 'package:flutter_guchi_memo/view/widgets/guchi_dialog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class GuchiHomePage extends ConsumerWidget {
  const GuchiHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final state = watch(guchiProvider);
    final guchiController = watch(guchiProvider.notifier);
    final modalController = watch(modalProvider.notifier);
    final refreshController = RefreshController(initialRefresh: false);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('愚痴メモ'),
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
        controller: refreshController,
        // guchiController.refreshController,
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
                      data.text.toString(),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      data.content.toString(),
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
                      await showDialog<Widget>(
                        context: context,
                        builder: (_) => GuchiDialog(id: data.id),
                      ).then((_) {
                        modalController.changeModalStateTrue();
                      });
                    },
                  ),
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          modalController.changeModalStateTrue();
          await showDialog<Widget>(
            context: context,
            builder: (_) => GuchiDialog(),
          ).then((_) {
            modalController.changeModalStateFlase();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
