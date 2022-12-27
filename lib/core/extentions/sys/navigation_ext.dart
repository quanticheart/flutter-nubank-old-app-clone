import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension NavigationExt on BuildContext {
  navigateToAndClear(Widget page) {
    Navigator.pushReplacement(
      this,
      PageRouteBuilder(pageBuilder: (BuildContext context, Animation animation,
          Animation secondaryAnimation) {
        return page;
      }),
    );
  }

  navigateTo(Widget page) {
    Navigator.push(
      this,
      PageRouteBuilder(pageBuilder: (BuildContext context, Animation animation,
          Animation secondaryAnimation) {
        return page;
      }),
    );
  }

  finish() => Navigator.of(this).pop();
}
