import 'package:flutter/material.dart';
import 'package:flutter_guchi_memo/guchi/guchi_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final guchiListProvider = ChangeNotifierProvider((ref) => GuchiList());

class GuchiHomePage extends ConsumerWidget {
  const GuchiHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final guchiList = watch(guchiListProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('GuchiRO'),
        ),
        body: ListView.builder(
            itemCount: 12,
            itemBuilder: (BuildContext context, int index) {
              return const ListTile(
                leading: Icon(Icons.ac_unit),
                trailing: Icon(Icons.delete),
                title: Center(child: Text('愚痴る')),
                subtitle: Center(
                  child: Text('あいつやりやがって見てろよ、あああああああ！！！！！！！！！'),
                ),
              );
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog<Widget>(
              context: context,
              builder: (context) {
                return SimpleDialog(
                  title: const Center(child: Text('愚痴る')),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 24,
                  ),
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 200,
                          padding: const EdgeInsets.only(left: 4),
                          child: TextFormField(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: '愚痴れ！',
                                labelText: 'どんな愚痴？'),
                            onChanged: (value) {
                              guchiList.title = value;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 200,
                      padding: const EdgeInsets.only(left: 4),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'ぶつけろ！',
                            labelText: 'くわしく！'),
                        onChanged: (value) {
                          guchiList.content = value;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          guchiList.addGuchi(
                              guchiList.title, guchiList.content);
                          Navigator.pop(context);
                        },
                        child: const Text('愚痴れ！！'))
                  ],
                );
              },
            );
          },
          child: const Icon(Icons.add),
        ));
  }
}
