import 'package:flutter/material.dart';
import 'package:nubank/core/extentions/sys/build_context_ext.dart';

class BottomCardMenu extends StatelessWidget {
  final IconData icon;
  final String label;

  const BottomCardMenu({Key? key, required this.icon, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double frac = context.screenWidth;
    double size;
    if (frac >= 800) {
      size = context.screenWidth / 8;
    } else if (frac >= 600) {
      size = context.screenWidth / 6;
    } else {
      size = context.screenWidth / 4;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Container(
        width: size,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.white54),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                size: 18,
              ),
              Text(
                label,
                style: const TextStyle(fontSize: 10),
              )
            ],
          ),
        ),
      ),
    );
  }
}
