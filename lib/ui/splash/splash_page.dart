import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nubank/core/extentions/sys/navigation_ext.dart';
import '../../core/extentions/sys/counter_ext.dart';
import '../home/home.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    delay(2, () {
      context.navigateTo(const HomePage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[800],
      body: Center(
        child: SvgPicture.asset(
          'assets/logo/logo.svg',
          height: 50,
          color: Colors.white,
        ),
      ),
    );
  }
}
