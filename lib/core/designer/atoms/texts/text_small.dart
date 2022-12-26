import 'package:flutter/material.dart';

class TextSmall extends StatelessWidget {
  final String title;
  final String description;

  const TextSmall({Key? key, required this.title, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(text: "$title ", children: [
      TextSpan(
        text: description,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    ]));
  }
}
