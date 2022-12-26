import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:nubank/core/extentions/sys/build_context_ext.dart';

double sm = 576.0;
double md = 768.0;
double lg = 992.0;
double xl = 1200.0;
double xxl = 1400.0;

extension MediaQueryExt on BuildContext {
  double getScreenSize() {
    double size = screenWidth;
    late double screen;

    if (size <= sm) {
      screen = sm;
    } else if (size >= sm) {
      screen = sm;
    } else if (size >= md) {
      screen = md;
    } else if (size >= lg) {
      screen = lg;
    } else if (size >= xl) {
      screen = xl;
    } else if (size >= xxl) {
      screen = xxl;
    }

    return screen;
  }

  bool isMobile() => screenWidth <= sm;
}

//screen sizes
const double WIDTH_MOBILE = 600;
const double WIDTH_TABLET = 900;
const double WIDTH_DESKTOP = 1024;

const double WIDTH_MAX_APP_WIDTH = 1200;

class ResponsiveHelper {
  final Size deviceSize;

  ResponsiveHelper({required BuildContext context, Size? size})
      : assert(size != null),
        deviceSize = size ?? MediaQuery.of(context).size;

  bool get isDesktop => deviceSize.width >= WIDTH_DESKTOP;

  double get optimalDeviceWidth => min(deviceSize.width, WIDTH_MAX_APP_WIDTH);

  bool isTablet({includeMobile = false}) =>
      deviceSize.width < WIDTH_DESKTOP &&
      (deviceSize.width > WIDTH_MOBILE || includeMobile);

  T value<T>({
    required T mobile,
    required T tablet,
    required T desktop,
  }) =>
      isMobile
          ? mobile
          : isDesktop
              ? desktop
              : (tablet ?? mobile);

  double incremental(double mobile, {double increment = 2}) => isMobile
      ? mobile
      : isDesktop
          ? mobile + (2 * increment)
          : mobile + increment;

  bool get isMobile => deviceSize.width <= WIDTH_MOBILE;

  double get defaultSmallGap => isDesktop
      ? 10
      : isMobile
          ? 6
          : 8;

  double get defaultGap => isDesktop
      ? 20
      : isMobile
          ? 10
          : 12;

  double get smallFontSize => isDesktop
      ? 14
      : isMobile
          ? 10
          : 12;

  double get normalFontSize => isDesktop
      ? 14
      : isMobile
          ? 12
          : 14;

  double get mediumFontSize => isDesktop
      ? 18
      : isMobile
          ? 14
          : 16;

  double get largeFontSize => isDesktop
      ? 20
      : isMobile
          ? 14
          : 18;
}

class RowOrColumn extends StatelessWidget {
  final bool showRow;
  final bool intrinsicRow;
  final List<Widget> children;
  final MainAxisAlignment rowMainAxisAlignment;
  final MainAxisSize rowMainAxisSize;
  final CrossAxisAlignment rowCrossAxisAlignment;

  final MainAxisAlignment columnMainAxisAlignment;
  final MainAxisSize columnMainAxisSize;
  final CrossAxisAlignment columnCrossAxisAlignment;

  const RowOrColumn({
    required Key key,
    this.showRow = true,
    this.intrinsicRow = false,
    required this.children,
    this.columnMainAxisAlignment = MainAxisAlignment.start,
    this.columnMainAxisSize = MainAxisSize.max,
    this.columnCrossAxisAlignment = CrossAxisAlignment.center,
    this.rowMainAxisAlignment = MainAxisAlignment.start,
    this.rowMainAxisSize = MainAxisSize.max,
    this.rowCrossAxisAlignment = CrossAxisAlignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return showRow
        ? _intrinsicHeightWrap(
            intrinsicRow,
            child: Row(
              mainAxisAlignment: rowMainAxisAlignment,
              crossAxisAlignment: rowCrossAxisAlignment,
              mainAxisSize: rowMainAxisSize,
              children: children,
            ),
          )
        : Column(
            mainAxisAlignment: columnMainAxisAlignment,
            crossAxisAlignment: columnCrossAxisAlignment,
            mainAxisSize: columnMainAxisSize,
            children: children,
          );
  }

  Widget _intrinsicHeightWrap(bool wrap, {child}) {
    return wrap
        ? IntrinsicHeight(
            child: child,
          )
        : child;
  }
}

class ExpandedIf extends StatelessWidget {
  final bool expanded;
  final Widget child;
  final int flex;

  const ExpandedIf(
      {required Key key,
      this.expanded = true,
      required this.child,
      this.flex = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return expanded
        ? Expanded(
            flex: flex,
            child: child,
          )
        : child;
  }
}

class MouseRegionIf extends StatelessWidget {
  final bool addRegion;
  final Widget child;

  final PointerExitEventListener onExit;
  final PointerEnterEventListener onEnter;
  final PointerHoverEventListener onHover;
  final MouseCursor cursor;

  const MouseRegionIf(
      {this.addRegion = true,
      required Key key,
      required this.child,
      required this.onExit,
      required this.onEnter,
      required this.onHover,
      required this.cursor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return addRegion
        ? MouseRegion(
            cursor: cursor,
            onEnter: onEnter,
            onExit: onExit,
            onHover: onHover,
            child: child,
          )
        : child;
  }
}

class PaddingSwitch extends StatelessWidget {
  final bool switchIf;
  final Widget child;
  final EdgeInsets padding;
  final EdgeInsets switchedPadding;

  const PaddingSwitch({
    required Key key,
    this.switchIf = false,
    required this.child,
    this.padding = EdgeInsets.zero,
    this.switchedPadding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: switchIf ? switchedPadding : padding,
      child: child,
    );
  }
}

class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ResponsiveWidget({
    required Key key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= WIDTH_DESKTOP) {
          return desktop;
        } else if (constraints.maxWidth > WIDTH_MOBILE) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}
