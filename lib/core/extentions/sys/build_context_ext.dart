import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  ThemeData get theme => Theme.of(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get screenHeight => mediaQuery.size.height;

  double get screenWidth => mediaQuery.size.width;

  double get statusBarHeight => mediaQuery.padding.top;

  double get navigationBarHeight => mediaQuery.padding.bottom;
}
