import 'package:flutter/material.dart';

class PageViewDotsIndicator extends StatelessWidget {
  final int index;

  const PageViewDotsIndicator({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Dots(currentSelected: 0 == index),
        const SizedBox(
          width: 8,
        ),
        Dots(currentSelected: 1 == index),
        const SizedBox(
          width: 8,
        ),
        Dots(currentSelected: 2 == index),
      ],
    );
  }
}

class Dots extends StatelessWidget {
  final bool currentSelected;

  Color getStatusColor(bool status) {
    return status ? Colors.white : Colors.white54;
  }

  const Dots({Key? key, required this.currentSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      height: 7,
      width: 7,
      decoration: BoxDecoration(
        color: getStatusColor(currentSelected),
        shape: BoxShape.circle,
      ),
    );
  }
}
