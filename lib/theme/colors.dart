import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class AppColors {
  final background = const Color(0xff222831);
  final secondaryBackground = const Color(0xff393e46);
  final text = const Color(0xffeeeeee);
  final secondaryText = const Color(0xff888b8f);
  final primary = const Color(0xff537BBB);

  final MaterialColor materialBackground =
      const MaterialColor(0xff222831, <int, Color>{
    50: Color(0xff111419), // 10%
    100: Color(0xff14181d), // 10%
    200: Color(0xff181c22), // 10%
    300: Color(0xff1b2027), // 10%
    400: Color(0xff1f242c), // 10%
    500: Color(0xff222831), // 10%
    600: Color(0xff383e46), // 10%
    700: Color(0xff4e535a), // 10%
    800: Color(0xff64696f), // 10%
    900: Color(0xff7a7e83), // 10%
  });

  const AppColors();
}
