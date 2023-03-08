import 'package:deck_deck_app/theme/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const colors = AppColors();
  static ThemeData define() {
    return ThemeData(
      primarySwatch: colors.materialBackground,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: colors.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)))),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: colors.secondaryText)),
      scaffoldBackgroundColor: colors.background,
      fontFamily: "SFRegular",
      primaryColor: colors.primary,
      focusColor: colors.background,
      textTheme:
          TextTheme(bodyMedium: TextStyle(color: colors.text, fontSize: 14)),
    );
  }
}
