import 'package:flutter/material.dart';

import '../../../../ui/home/widgets/screen/nubank_theme.dart';
import '../others/space_small.dart';

class MenuHomeItem extends StatelessWidget {
  const MenuHomeItem({Key? key, required this.icon, required this.label})
      : super(key: key);

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 35,
        decoration: const BoxDecoration(
            border: Border(
                top: BorderSide(width: 0.7, color: Colors.white54),
                bottom: BorderSide(width: 0.7, color: Colors.white54))),
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(nuBankPurple()),
              elevation: MaterialStateProperty.all<double>(0)),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(icon),
                  const SpaceSmall(),
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              const Icon(
                Icons.chevron_right_outlined,
                size: 18,
              )
            ],
          ),
        ),
      ),
    );
  }
}
