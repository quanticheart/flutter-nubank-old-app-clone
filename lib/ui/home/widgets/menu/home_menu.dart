import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nubank/core/designer/atoms/others/space.dart';
import 'package:nubank/core/designer/atoms/others/space_small.dart';
import 'package:nubank/core/designer/atoms/texts/text_menu_label.dart';
import 'package:nubank/core/designer/atoms/texts/text_small.dart';
import 'package:nubank/core/extentions/sys/build_context_ext.dart';

import '../../../../core/designer/atoms/buttons/nu_button.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight * 0.55,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SvgPicture.asset(
              "assets/logo/logo.svg",
              height: 120,
              color: Colors.white,
            ),
            const TextSmall(title: "Banco", description: "260 - Nu SA."),
            const SpaceSmall(),
            const TextSmall(title: "Agência", description: "0001"),
            const SpaceSmall(),
            const TextSmall(title: "Conta", description: "0000000-0"),
            const Space(),
            Column(
              children: [
                const MenuHomeItem(
                    icon: Icons.info_outlined, label: "Me Ajude"),
                const MenuHomeItem(
                    icon: Icons.info_outlined, label: "Me Ajude"),
                const MenuHomeItem(
                    icon: Icons.info_outlined, label: "Me Ajude"),
                const MenuHomeItem(
                    icon: Icons.info_outlined, label: "Me Ajude"),
                const MenuHomeItem(
                    icon: Icons.info_outlined, label: "Me Ajude"),
                const MenuHomeItem(
                    icon: Icons.info_outlined, label: "Me Ajude"),
                const MenuHomeItem(
                    icon: Icons.info_outlined, label: "Me Ajude"),
                const Space(),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: NuBankButton(
                      title: "SAIR",
                      onPressed: () {},
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
