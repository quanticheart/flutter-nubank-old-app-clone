import 'package:flutter/material.dart';

import '../../../../core/designer/atoms/others/space_small.dart';

class FirstCardHome extends StatelessWidget {
  const FirstCardHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(3),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.credit_card,
                                color: Colors.grey,
                              ),
                              SpaceSmall(),
                              Text(
                                'Cartão de Crédito',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 13),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        width: double.infinity,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'FATURA ATUAL',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color: Colors.teal,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text.rich(
                                              TextSpan(
                                                text: 'R\$ ',
                                                children: [
                                                  TextSpan(
                                                      text: '17.550',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  TextSpan(text: ',35'),
                                                ],
                                              ),
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                color: Colors.teal,
                                                fontSize: 28,
                                              ),
                                            ),
                                            Text.rich(
                                              TextSpan(
                                                text: 'Limite disponível',
                                                children: [
                                                  TextSpan(
                                                      text: ' R\$ 55.750,00',
                                                      style: TextStyle(
                                                          color: Colors.green,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ],
                                              ),
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 12, bottom: 12, left: 10, right: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      width: 7,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              color: Colors.orange,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              color: Colors.blue,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
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
                      Icons.shopping_cart,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Flexible(
                      child: Text(
                        'Compra mais recente em Super Mercado no valor de R\$ 30,00 sexta ',
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
}
