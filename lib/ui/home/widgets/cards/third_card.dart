import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nubank/core/designer/atoms/buttons/nu_button_effect.dart';
import 'package:nubank/core/designer/atoms/others/space.dart';

class ThirdCardHome extends StatefulWidget {
  const ThirdCardHome({super.key});

  @override
  State<StatefulWidget> createState() => _ThirdCardState();
}

class _ThirdCardState extends State<ThirdCardHome> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SvgPicture.asset('assets/icons/gift-outline.svg',
              color: Colors.grey, semanticsLabel: 'eye'),
          Column(
            children: <Widget>[
              const Text(
                'Nubank Rewards',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 26),
              ),
              const Space(),
              Text(
                'Acumule pontos que nunca expiram e troque por passagens aéreas ou serviços que você realmente usa.',
                style: TextStyle(color: Colors.grey[700], fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          NuBankButtonEffect(title: "ATIVE O SEU REWARDS", onPressed: () {}),

        ],
      ),
    );
  }
}
