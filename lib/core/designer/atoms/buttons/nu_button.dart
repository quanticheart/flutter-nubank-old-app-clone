import 'package:flutter/material.dart';

class NuBankButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const NuBankButton({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 0.7, color: Colors.white54),
        borderRadius: const BorderRadius.all(Radius.circular(3)),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.transparent),
            elevation: MaterialStateProperty.all<double>(0),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3),
            ))),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
