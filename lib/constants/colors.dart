import 'package:flutter/material.dart';

class AppColors {
  static const Map<int, Color> orange = <int, Color>{
    50: Color(0xFFFCF2E7),
    100: Color(0xFFF8DEC3),
    200: Color(0xFFF3C89C),
    300: Color(0xFFEEB274),
    400: Color(0xFFEAA256),
    500: Color(0xFFE69138),
    600: Color(0xFFE38932),
    700: Color(0xFFDF7E2B),
    800: Color(0xFFDB7424),
    900: Color(0xFFD56217)
  };

  static Color primary = const Color(0xffF9B635);
  static Color white = const Color(0xffffffff);
  static Color black = const Color(0xff000000);
  static Color grey = const Color(0xff656565);
  static Color darkGrey = const Color(0xff555555);
  static Color lightGrey = const Color(0xffF5F5F5);
  static Color lightBlue = const Color(0xff47C5FB);
  static Color darkBlue = const Color(0xff00569E);
  static Color green = const Color(0xffA4C639);
  static Color tosca = const Color(0xff39C6A4);

  // TextInput
  static const primaryTextInputColor = Color(0xff4338CA);
  static const secondaryTextInputColor = Color(0xff6D28D9);
  static const accentTextInputColor = Color(0xffffffff);
  static const errorTextInputColor = Color(0xffEF4444);

  static LinearGradient getGradient(Color colorStart, Color colorEnd) {
    return LinearGradient(
      colors: [colorStart, colorEnd],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }
}
