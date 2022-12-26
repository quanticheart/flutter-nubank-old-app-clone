import 'package:flutter/material.dart';

import '../../../../ui/home/widgets/screen/nubank_theme.dart';

class NuBankButtonEffect extends StatefulWidget {
  final String title;
  final VoidCallback onPressed;

  const NuBankButtonEffect(
      {Key? key, required this.title, required this.onPressed})
      : super(key: key);

  @override
  State<NuBankButtonEffect> createState() =>
      _NuBankButtonEffectState(title, onPressed);
}

class _NuBankButtonEffectState extends State<NuBankButtonEffect> {
  final String title;
  final VoidCallback onPressed;
  bool _buttonPressed = false;

  _NuBankButtonEffectState(this.title, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          border: Border.all(width: 0.7, color: nuBankPurple())),
      child: MaterialButton(
        onHighlightChanged: (pressed) {
          setState(() {
            _buttonPressed = pressed;
          });
        },
        highlightColor: nuBankPurple(),
        disabledTextColor: Colors.white,
        textColor: _buttonPressed ? Colors.white : nuBankPurple(),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
        color: Colors.transparent,
        elevation: 0,
        disabledElevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        hoverElevation: 0,
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ),
    );
  }
}
