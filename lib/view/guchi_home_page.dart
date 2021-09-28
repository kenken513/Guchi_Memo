import 'package:flutter/material.dart';
import 'package:flutter_guchi_memo/controllers/auth_controller/auth_controller.dart';
import 'package:flutter_guchi_memo/controllers/guchi_controller/guchi_controller.dart';
import 'package:flutter_guchi_memo/controllers/modal_controller/modal_controller.dart';
import 'package:flutter_guchi_memo/controllers/setting_controller/setting_controller.dart';
import 'package:flutter_guchi_memo/model/modal_state/modal_state.dart';
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
    final authController = watch(authProvider);
    final isSignIn = authController.isSignIn;
    final settingController = watch(settingProvider);
    final authState = settingController.authState;
    final refreshController = RefreshController(initialRefresh: false);

    return ProviderListener(
      provider: modalProvider,
      onChange: (context, ModalState modalState) async {
        if (authState) {
          if (modalState.isOpen) {
            if (!isSignIn) {
              await showDialog<void>(
                context: context,
                builder: (_) => GuchiDialog(),
              );
            }
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
          controller: refreshController,
          // guchiController.refreshController,
          onLoading: guchiController.onLoading,
          child: ListView.builder(
              itemCount: state.guchiList.length,
              itemBuilder: (context, index) {
                final data = state.guchiList[index];
                return ListTile(
                  leading: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(Icons.speaker_notes),
                  ),
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
                  onLongPress: () async {
                    await showDialog<Widget>(
                      context: context,
                      builder: (_) => GuchiDialog(id: data.id),
                    ).then((_) async {
                      await modalController.changeModalStateTrue();
                    });
                  },
                );
              }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await modalController.changeModalStateTrue();
            await showDialog<Widget>(
              context: context,
              builder: (_) => GuchiDialog(),
            ).then((_) async {
              await modalController.changeModalStateFlase();
            });
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
