import 'package:flutter/material.dart';
import 'package:nubank/ui/home/widgets/screen/nubank_app.dart';
import 'package:nubank/ui/splash/splash_page.dart';

import 'core/extentions/sys/system_ext.dart';

void main() {
  uIOverlayStyle();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return NuBankApp(
      home: const SplashPage(),
    );
  }
}
