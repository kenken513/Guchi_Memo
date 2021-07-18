import 'package:flutter/material.dart';
import 'package:flutter_guchi_memo/guchi/guchi.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GuchiHomePage extends ConsumerWidget {
  const GuchiHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
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
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          // notifier.addGuchi(
                          //   id,
                          //   title,
                          //   content,
                          //   createDay,
                          //   editDay,
                          // );
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
