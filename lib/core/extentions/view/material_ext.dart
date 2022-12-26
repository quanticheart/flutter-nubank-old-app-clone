import 'package:flutter/material.dart';

extension ValidEmail on String {
  bool get isValidEmail {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    return RegExp(pattern).hasMatch(this);
  }
}

// extension UIThemeExtension on BuildContext {
//   // * (default) TextTheme
//   TextStyle? get h1 => Theme.of(this).textTheme.headline1;
//
//   TextStyle get h2 => Theme.of(this).textTheme.headline2;
//
//   TextStyle get h3 => Theme.of(this).textTheme.headline3;
//
//   TextStyle get h4 => Theme.of(this).textTheme.headline4;
//
//   TextStyle get h5 => Theme.of(this).textTheme.headline5;
//
//   TextStyle get h6 => Theme.of(this).textTheme.headline6;
//
//   TextStyle get sub1 => Theme.of(this).textTheme.subtitle1;
//
//   TextStyle get sub2 => Theme.of(this).textTheme.subtitle2;
//
//   TextStyle get body1 => Theme.of(this).textTheme.bodyText1;
//
//   TextStyle get body2 => Theme.of(this).textTheme.bodyText2;
//
//   TextStyle get button => Theme.of(this).textTheme.button;
//
//   // * PrimaryTextTheme
//   TextStyle get pH1 => Theme.of(this).primaryTextTheme.headline1;
//
//   TextStyle get pH2 => Theme.of(this).primaryTextTheme.headline2;
//
//   TextStyle get pH3 => Theme.of(this).primaryTextTheme.headline3;
//
//   TextStyle get pH4 => Theme.of(this).primaryTextTheme.headline4;
//
//   TextStyle get pH5 => Theme.of(this).primaryTextTheme.headline5;
//
//   TextStyle get pH6 => Theme.of(this).primaryTextTheme.headline6;
//
//   TextStyle get pSub1 => Theme.of(this).primaryTextTheme.subtitle1;
//
//   TextStyle get pSub2 => Theme.of(this).primaryTextTheme.subtitle2;
//
//   TextStyle get pBody1 => Theme.of(this).primaryTextTheme.bodyText1;
//
//   TextStyle get pBody2 => Theme.of(this).primaryTextTheme.bodyText2;
//
//   TextStyle get pButton => Theme.of(this).primaryTextTheme.button;
//
//   // * AccentTextTheme
//   TextStyle get aH1 => Theme.of(this).accentTextTheme.headline1;
//
//   TextStyle get aH2 => Theme.of(this).accentTextTheme.headline2;
//
//   TextStyle get aH3 => Theme.of(this).accentTextTheme.headline3;
//
//   TextStyle get aH4 => Theme.of(this).accentTextTheme.headline4;
//
//   TextStyle get aH5 => Theme.of(this).accentTextTheme.headline5;
//
//   TextStyle get aH6 => Theme.of(this).accentTextTheme.headline6;
//
//   TextStyle get aSub1 => Theme.of(this).accentTextTheme.subtitle1;
//
//   TextStyle get aSub2 => Theme.of(this).accentTextTheme.subtitle2;
//
//   TextStyle get aBody1 => Theme.of(this).accentTextTheme.bodyText1;
//
//   TextStyle get aBody2 => Theme.of(this).accentTextTheme.bodyText2;
//
//   TextStyle get aButton => Theme.of(this).accentTextTheme.button;
// }

final GlobalKey<NavigatorState> appKey = GlobalKey<NavigatorState>();

extension Responsive on num {
  double get width =>
      this * MediaQuery.of(appKey.currentContext!).size.width / 375;

  double get height =>
      this * MediaQuery.of(appKey.currentContext!).size.height / 812;
// I give this sizes according to the iPhone X. You can base it to another phone.
}

extension StringEditor on String {
  String get capitalizeFirst =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1)}' : '';

  String get convertToTitle {
    final List<String> words = split(' ');
    final capitalizedWords = words.map((word) {
      if (word.trim().isNotEmpty) {
        final String firstLetter = word.trim().substring(0, 1).toUpperCase();
        final String remainingLetters = word.trim().substring(1);

        return '$firstLetter$remainingLetters';
      }
      return '';
    });
    return capitalizedWords.join(' ');
  }
}
