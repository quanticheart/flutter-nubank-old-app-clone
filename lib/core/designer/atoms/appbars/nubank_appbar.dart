import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nubank/core/extentions/sys/build_context_ext.dart';

class NuBankAppBar extends StatelessWidget {
  final bool menuStatus;
  final VoidCallback callback;

  const NuBankAppBar(
      {Key? key, required this.menuStatus, required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context.statusBarHeight,
        ),
        GestureDetector(
          onTap: callback,
          child: SizedBox(
            height: context.appBarHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/logo/logo.svg',
                      height: 20,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "User",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                Icon(menuStatus
                    ? Icons.expand_less_outlined
                    : Icons.expand_more_outlined)
              ],
            ),
          ),
        )
      ],
    );
  }
}

extension AppBar on BuildContext {
  double get appBarHeight => screenHeight * .15;
}