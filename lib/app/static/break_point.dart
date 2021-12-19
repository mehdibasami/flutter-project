import 'package:flutter/material.dart';

class StaticBreakPoint {
  static const kMobileBreakpoint = 576;
  static const kTabletBreakpoint = 1024;
  static const kDesktopBreakPoint = 1366;

  static int gridCount(BuildContext context) {
    if (MediaQuery.of(context).size.width <= StaticBreakPoint.kMobileBreakpoint) {
      return 2;
    } else if (MediaQuery.of(context).size.width > StaticBreakPoint.kMobileBreakpoint &&
        MediaQuery.of(context).size.width <= StaticBreakPoint.kTabletBreakpoint) {
      return 3;
    } else if (MediaQuery.of(context).size.width > StaticBreakPoint.kTabletBreakpoint &&
        MediaQuery.of(context).size.width <= StaticBreakPoint.kDesktopBreakPoint) {
      return 5;
    } else {
      return 6;
    }
  }
}
