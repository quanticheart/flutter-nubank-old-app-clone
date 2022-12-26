import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/designer/atoms/others/space_small.dart';

class SecondCardHome extends StatefulWidget {
  const SecondCardHome({super.key});

  @override
  State<SecondCardHome> createState() => _SecondCardHome();
}

class _SecondCardHome extends State<SecondCardHome>
    with AutomaticKeepAliveClientMixin {
  bool _showValue = false;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.attach_money,
                              color: Colors.grey,
                            ),
                            SpaceSmall(),
                            Text(
                              'Conta',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 13),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _showValue = !_showValue;
                            });
                          },
                          child: SvgPicture.asset(
                              !_showValue
                                  ? 'assets/icons/eye-off-outline.svg'
                                  : 'assets/icons/eye-outline.svg',
                              color: Colors.grey,
                              semanticsLabel: 'eye'),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Saldo disponível',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                ),
                              ),
                              _showValue
                                  ? const Text.rich(
                                      TextSpan(
                                        text: 'R\$ 1.997.853,37',
                                      ),
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 28,
                                      ),
                                    )
                                  : Container(
                                      height: 32,
                                      width: 160,
                                      color: Colors.grey[300],
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.grey[200],
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.credit_card,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Flexible(
                      child: Text(
                        'Compra mais recente em Super Mercado no valor de R\$ 6.000,00 ontem ',
                        style: TextStyle(color: Colors.black, fontSize: 13),
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: Colors.grey[400],
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
