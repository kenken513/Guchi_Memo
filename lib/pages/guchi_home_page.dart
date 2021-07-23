// import 'package:flutter/material.dart';
// import 'package:flutter_guchi_memo/guchi/guchi_list.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final guchiProvider = ChangeNotifierProvider((ref) => GuchiList());

// class GuchiHomePage extends ConsumerWidget {
//   const GuchiHomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, ScopedReader watch) {
//     final guchiListProvider = watch(guchiProvider);
//     final guchiList = guchiListProvider.guchiList;
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('GuchiRO'),
//         ),
//         body: ListView(
//           children: guchiList
//               .map((guchi) => ListTile(
//                     title: Center(child: Text(guchi.title)),
//                     subtitle: Center(
//                       child: Text(guchi.content),
//                     ),
//                     leading: const Icon(Icons.ac_unit_sharp),
//                     trailing: IconButton(
//                         onPressed: () {
//                           // final id = guchi.guchiId;
//                           // guchiListProvider.delteGuchi(id);
//                         },
//                         icon: const Icon(Icons.delete)),
//                     onLongPress: () {
//                       showDialog<Widget>(
//                         context: context,
//                         builder: (context) {
//                           return SimpleDialog(
//                             title: const Center(child: Text('愚痴る')),
//                             contentPadding: const EdgeInsets.symmetric(
//                               horizontal: 14,
//                               vertical: 24,
//                             ),
//                             children: [
//                               Row(
//                                 children: [
//                                   Container(
//                                     width: 200,
//                                     padding: const EdgeInsets.only(left: 4),
//                                     child: TextFormField(
//                                       decoration: const InputDecoration(
//                                         border: OutlineInputBorder(),
//                                         hintText: '愚痴れ！',
//                                         labelText: 'どんな愚痴？',
//                                       ),
//                                       onChanged: (value) {
//                                         guchiListProvider.title = value;
//                                       },
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(
//                                 height: 20,
//                               ),
//                               Container(
//                                 width: 200,
//                                 padding: const EdgeInsets.only(left: 4),
//                                 child: TextFormField(
//                                   decoration: const InputDecoration(
//                                     border: OutlineInputBorder(),
//                                     hintText: 'ぶつけろ！',
//                                     labelText: 'くわしく！',
//                                   ),
//                                   onChanged: (value) {
//                                     guchiListProvider.content = value;
//                                   },
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 20,
//                               ),
//                               ElevatedButton(
//                                   onPressed: () {
//                                     // guchiListProvider.upDateGuchi(
//                                     //     guchi.id,
//                                     //     guchiListProvider.title,
//                                     //     guchiListProvider.content);

//                                     Navigator.pop(context);
//                                   },
//                                   child: const Text(
//                                     '愚痴れ！！',
//                                   ))
//                             ],
//                           );
//                         },
//                       );
//                     },
//                   ))
//               .toList(),
//         ),
//         floatingActionButtonLocation: 
// FloatingActionButtonLocation.centerDocked,
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             showDialog<Widget>(
//               context: context,
//               builder: (context) {
//                 return SimpleDialog(
//                   title: const Center(child: Text('愚痴る')),
//                   contentPadding: const EdgeInsets.symmetric(
//                     horizontal: 14,
//                     vertical: 24,
//                   ),
//                   children: [
//                     Row(
//                       children: [
//                         Container(
//                           width: 200,
//                           padding: const EdgeInsets.only(left: 4),
//                           child: TextFormField(
//                             decoration: const InputDecoration(
//                               border: OutlineInputBorder(),
//                               hintText: '愚痴れ！',
//                               labelText: 'どんな愚痴？',
//                             ),
//                             onChanged: (value) {
//                               guchiListProvider.title = value;
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Container(
//                       width: 200,
//                       padding: const EdgeInsets.only(left: 4),
//                       child: TextFormField(
//                         decoration: const InputDecoration(
//                           border: OutlineInputBorder(),
//                           hintText: 'ぶつけろ！',
//                           labelText: 'くわしく！',
//                         ),
//                         onChanged: (value) {
//                           guchiListProvider.content = value;
//                         },
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     ElevatedButton(
//                         onPressed: () async {
//                           await guchiListProvider.insertGuchi(
//                             // guchiListProvider.title,
//                             // guchiListProvider.content,
//                             guchiListProvider.guchi,
//                           );
//                           Navigator.pop(context);
//                         },
//                         child: const Text(
//                           '愚痴れ！！',
//                         ))
//                   ],
//                 );
//               },
//             );
//           },
//           child: const Icon(Icons.add),
//         ));
//   }
// }
