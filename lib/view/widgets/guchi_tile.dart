import 'package:flutter/material.dart';

class GuchiTile extends StatelessWidget {
  const GuchiTile(
      {Key? key, this.text, this.content, this.onLongPress, this.onPressed})
      : super(key: key);

  final String? text;
  final String? content;
  final void Function()? onLongPress;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.pink, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: ListTile(
          title: Text(
            text ?? '',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            content ?? '',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.delete,
              color: Colors.black,
            ),
          ),
          onLongPress: onLongPress,
        ),
      ),
    );
  }
}
