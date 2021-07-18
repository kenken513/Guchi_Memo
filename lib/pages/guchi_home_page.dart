import 'package:flutter/material.dart';

class GuchiHomePage extends StatelessWidget {
  const GuchiHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
          onPressed: () {},
          child: const Icon(Icons.add),
        ));
  }
}
