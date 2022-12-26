import 'package:flutter/cupertino.dart';

extension NavigationExt on BuildContext {
  void navigateTo(Widget page) {
    Navigator.pushReplacement(
      this,
      PageRouteBuilder(pageBuilder: (BuildContext context, Animation animation,
          Animation secondaryAnimation) {
        return page;
      }),
    );
  }
}
