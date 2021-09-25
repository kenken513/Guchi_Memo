import 'package:flutter/material.dart';
import 'package:flutter_guchi_memo/view/setting_page.dart';
import 'package:flutter_guchi_memo/controllers/guchi_controller/guchi_controller.dart';
import 'package:flutter_guchi_memo/view/widgets/guchi_dialog.dart';
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
                    builder: (_) => GuchiDialog(id: data.id),
                  );
                },
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog<Widget>(
            context: context,
            builder: (_) => GuchiDialog(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
