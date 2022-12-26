import 'package:flutter/material.dart';
import 'package:nubank/core/extentions/sys/build_context_ext.dart';
import 'package:nubank/ui/home/widgets/cards/first_card_home.dart';
import 'package:nubank/ui/home/widgets/cards/second_card_home.dart';
import 'package:nubank/ui/home/widgets/cards/third_card.dart';

import '../card/card_home.dart';

class PageViewHome extends StatefulWidget {
  final ValueChanged<int> onChangeCallback;
  final GestureDragUpdateCallback onPanUpdate;
  final GestureDragEndCallback onTapCancel;
  final double topLocation;
  final bool blockPageView;

  const PageViewHome(
      {Key? key,
      required this.onChangeCallback,
      required this.onPanUpdate,
      required this.topLocation,
      required this.blockPageView,
      required this.onTapCancel})
      : super(key: key);

  @override
  State<PageViewHome> createState() => _PageViewHomeState();
}

class _PageViewHomeState extends State<PageViewHome> {
  late Tween<double> _tween;

  @override
  void initState() {
    super.initState();
    _tween = Tween<double>(begin: 150.0, end: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    double frac = context.screenWidth;
    PageController pageController;
    if (frac >= 800) {
      pageController = PageController(viewportFraction: 1/3);
    } else if (frac >= 600) {
      pageController = PageController(viewportFraction: 1/2);
    } else {
      pageController = PageController(viewportFraction: 1.0);
    }

    return TweenAnimationBuilder<double>(
        tween: _tween,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutExpo,
        builder: (context, value, child) {
          return AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            top: widget.topLocation,
            // top: context.statusBarHeight + context.appBarHeight,
            height: context.screenHeight * .50,
            left: value,
            right: value * -1,
            child: GestureDetector(
              onPanUpdate: widget.onPanUpdate,
              onPanEnd: widget.onTapCancel,
              child: PageView(
                controller: pageController,
                physics: widget.blockPageView
                    ? const NeverScrollableScrollPhysics()
                    : const BouncingScrollPhysics(),
                onPageChanged: widget.onChangeCallback,
                children: const [
                  CardHome(child: FirstCardHome()),
                  CardHome(child: SecondCardHome()),
                  CardHome(child: ThirdCardHome()),
                ],
              ),
            ),
          );
        });
  }
}
