import 'package:flutter/material.dart';
import 'package:flutter_guchi_memo/controllers/auth_controller.dart';
import 'package:flutter_guchi_memo/controllers/guchi_controller.dart';
import 'package:flutter_guchi_memo/controllers/setting_controller.dart';
import 'package:flutter_guchi_memo/controllers/start_up_guide_dialog_controller.dart';
import 'package:flutter_guchi_memo/model/auth_state/auth_state.dart';
import 'package:flutter_guchi_memo/view/auth_page.dart';
import 'package:flutter_guchi_memo/view/setting_page.dart';
import 'package:flutter_guchi_memo/view/widgets/guchi_dialog.dart';
import 'package:flutter_guchi_memo/view/widgets/guchi_tile.dart';
import 'package:flutter_guchi_memo/view/widgets/start_up_guide_dialog.dart';
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
    final isLocked = useState(false);

    useEffect(() {
      Future(() async {
        await ref.read(guchiProvider.notifier).initializeGuchi();

        final isOpendStartUpGuideDialog =
            ref.read(startUpGuideDialogProvider).fetchStartUpGuideState;

        if (isOpendStartUpGuideDialog) {
          await StartUpGuideDialog.show(context);
        }
      });

      ref.read(authProvider.notifier).initState();

      return null;
    }, []);

    ref.listen<AuthState>(
      authProvider,
      (previous, next) async {
        isLocked.value = ref.watch(settingControllerProvider).fetchIsLocked;
        if (isLocked.value) {
          if (!next.isSignIn) {
            await AuthPage.show(context);
          }
        }
      },
    );

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
        onLoading: () async {
          await ref.read(guchiProvider.notifier).onLoading();
          refreshController.value.loadComplete();
        },
        child: ListView.builder(
          itemCount: state.guchiList.length,
          itemBuilder: (context, index) {
            final data = state.guchiList[index];
            final id = data.id;
            return GuchiTile(
              text: data.text,
              content: data.content,
              onLongPress: () async {
                await GuchiDialog.show(context, guchi: data);
              },
              onPressed: () {
                if (id != null) {
                  guchiController.deleteGuchi(id);
                }
              },
            );
          },
        ),
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
