import 'package:flutter/material.dart';

class TextDivider extends StatelessWidget {
  const TextDivider({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Divider(
          color: Theme.of(context).primaryColor,
          thickness: 2,
        ),
        Center(
          child: Container(
              padding: const EdgeInsets.only(left: 8, right: 8),
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Text(
                title,
                style: const TextStyle(fontSize: 16),
              )),
        ),
      ],
    );
  }
}
