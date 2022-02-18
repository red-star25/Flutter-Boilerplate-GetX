import 'package:base_project_getx/constants/colors.dart';
import 'package:base_project_getx/constants/font_family.dart';
import 'package:flutter/material.dart';

final ThemeData themeData = ThemeData(
  fontFamily: FontFamily.productSans,
  brightness: Brightness.light,
  primaryColor: AppColors.orange[500],
  colorScheme: ColorScheme.fromSwatch(
          primarySwatch:
              MaterialColor(AppColors.orange[500]!.value, AppColors.orange))
      .copyWith(
    secondary: AppColors.orange[500],
  ),
  textTheme: const TextTheme(
    headline2: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
    ),
    headline5: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    headline6: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    bodyText1: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    bodyText2: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  ),
);

final ThemeData themeDataDark = ThemeData(
  fontFamily: FontFamily.productSans,
  brightness: Brightness.dark,
  primaryColor: AppColors.orange[500],
  colorScheme:
      ColorScheme.fromSwatch().copyWith(secondary: AppColors.orange[500]),
);
