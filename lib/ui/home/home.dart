import 'package:flutter/material.dart';
import 'package:nubank/core/designer/atoms/appbars/nubank_appbar.dart';
import 'package:nubank/core/designer/templates/home/listview_menu_home.dart';
import 'package:nubank/core/extentions/sys/build_context_ext.dart';
import 'package:nubank/ui/home/widgets/menu/home_menu.dart';
import 'package:nubank/ui/home/widgets/pageview/pageview_dots.dart';
import 'package:nubank/ui/home/widgets/pageview/pageview_home.dart';
import 'package:nubank/ui/home/widgets/screen/nubank_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool _menuUserState;
  late int _indexPage;
  late double _yP;

  @override
  void initState() {
    super.initState();
    _menuUserState = false;
    _indexPage = 0;
    _yP = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    double posBottomLimit = context.screenHeight * .75;
    double posTopLimit = context.statusBarHeight + context.appBarHeight;
    double middlePos = (posBottomLimit - posTopLimit) / 2;

    _yP = _yP <= 0.0 ? (context.statusBarHeight + context.appBarHeight) : _yP;
    return Scaffold(
      backgroundColor: nuBankPurple(),
      body: Container(
        alignment: Alignment.topCenter,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            NuBankAppBar(
              callback: () {
                setState(() {
                  _menuUserState = !_menuUserState;
                  _yP = _menuUserState ? posBottomLimit : posTopLimit;
                });
              },
              menuStatus: _menuUserState,
            ),
            Positioned(
                top: context.statusBarHeight + context.appBarHeight,
                left: 0,
                right: 0,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: _menuUserState ? 1 : 0,
                  child: const HomeMenu(),
                )),
            PageViewHome(
              blockPageView: _menuUserState,
              topLocation: _yP,
              onChangeCallback: (index) {
                setState(() {
                  _indexPage = index;
                });
              },
              onPanUpdate: (details) {
                setState(() {
                  _yP += details.delta.dy;
                  _yP = _yP < posTopLimit ? posTopLimit : _yP;
                  _yP = _yP > posBottomLimit ? posBottomLimit : _yP;

                  if (_yP != posBottomLimit && details.delta.dy > 0) {
                    _yP = _yP > posTopLimit + middlePos - 100
                        ? posBottomLimit
                        : _yP;
                  }

                  if (_yP != posTopLimit && details.delta.dy < 0) {
                    _yP = _yP < posBottomLimit - middlePos + 100
                        ? posTopLimit
                        : _yP;
                  }

                  if (_yP == posBottomLimit) {
                    _menuUserState = true;
                  } else if (_yP == posTopLimit) {
                    _menuUserState = false;
                  }
                });
              },
              onTapCancel: (details) {
                setState(() {
                  if (_yP != posTopLimit || _yP != posBottomLimit) {
                    if (_yP >= middlePos) {
                      _yP = posBottomLimit;
                    } else {
                      _yP = posTopLimit;
                    }
                  }
                });
              },
            ),
            Positioned(
                top: context.statusBarHeight +
                    context.appBarHeight +
                    context.screenHeight * .50,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: _menuUserState ? 0 : 1,
                  child: PageViewDotsIndicator(
                    index: _indexPage,
                  ),
                )),
            ListViewMenuHome(menuUserState: _menuUserState),
          ],
        ),
      ),
    );
  }
}
