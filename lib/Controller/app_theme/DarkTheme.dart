import 'package:flutter/material.dart';
import 'package:prayas_capital/core/utils/ColorFile.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  textTheme: TextTheme(titleLarge: TextStyle(color: AppColors.white)),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.blackShade7,
    iconTheme: IconThemeData(
      color: AppColors.white,
    ),
  ),
  colorScheme: ColorScheme.dark(
    background: AppColors.black,
    primary: AppColors.blackShade7,
    onPrimary: AppColors.black,
    onSecondary: AppColors.white,
    onBackground: AppColors.blackShade7,
    secondary: AppColors.blackShade7,
    onError: AppColors.white,
    surface: AppColors.grey,
  ),
);
