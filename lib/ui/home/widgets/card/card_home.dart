import 'package:flutter/material.dart';

class CardHome extends StatelessWidget {
  final Widget child;

  const CardHome({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(3),
        ),
        child: child,
      ),
    );
  }
}
