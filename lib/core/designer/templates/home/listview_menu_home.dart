import 'package:flutter/material.dart';
import 'package:nubank/core/designer/atoms/cards/bottom_card_menu.dart';
import 'package:nubank/core/extentions/sys/build_context_ext.dart';

class ListViewMenuHome extends StatefulWidget {
  final bool menuUserState;

  const ListViewMenuHome({Key? key, required this.menuUserState})
      : super(key: key);

  @override
  State<ListViewMenuHome> createState() => _ListViewMenuHomeState();
}

class _ListViewMenuHomeState extends State<ListViewMenuHome> {
  late Tween<double> _tween;

  @override
  void initState() {
    super.initState();
    _tween = Tween<double>(begin: 150.0, end: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
        tween: _tween,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutExpo,
        builder: (context, value, child) {
          return AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            bottom:
                widget.menuUserState ? -20 : 0 + context.navigationBarHeight,
            left: value,
            right: value * -1,
            height: context.screenHeight * .15,
            child: IgnorePointer(
              ignoring: widget.menuUserState,
              child: AnimatedOpacity(
                opacity: widget.menuUserState ? 0 : 1,
                duration: const Duration(milliseconds: 300),
                child: ListView(
                  physics: widget.menuUserState
                      ? const NeverScrollableScrollPhysics()
                      : const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: const [
                    BottomCardMenu(
                        icon: Icons.ad_units_outlined, label: "Test"),
                    BottomCardMenu(
                        icon: Icons.ad_units_outlined, label: "Test"),
                    BottomCardMenu(
                        icon: Icons.ad_units_outlined, label: "Test"),
                    BottomCardMenu(
                        icon: Icons.ad_units_outlined, label: "Test"),
                    BottomCardMenu(
                        icon: Icons.ad_units_outlined, label: "Test"),
                    BottomCardMenu(
                        icon: Icons.ad_units_outlined, label: "Test"),
                    BottomCardMenu(
                        icon: Icons.ad_units_outlined, label: "Test"),
                    BottomCardMenu(
                        icon: Icons.ad_units_outlined, label: "Test"),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
