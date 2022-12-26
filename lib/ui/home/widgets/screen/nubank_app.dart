import 'package:flutter/material.dart';

import '../../../../core/designer/atoms/app_scroll_behavior.dart';
import 'nubank_theme.dart';

class NuBankApp extends StatelessWidget {
  Widget? _home;

  NuBankApp({super.key, required Widget home}) {
    _home = home;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: AppScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'Nu bank',
      theme: nuBankThemeData(),
      home: _home,
    );
  }
}
