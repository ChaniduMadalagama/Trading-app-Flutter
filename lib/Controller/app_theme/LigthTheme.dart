import 'package:flutter/material.dart';
import '../../core/utils/ColorFile.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.appColor,
    iconTheme: IconThemeData(
      color: AppColors.white,
    ),
  ),
  textTheme: TextTheme(
    titleLarge: TextStyle(color: AppColors.black),
  ),
  colorScheme: ColorScheme.light(
    background: AppColors.white,
    primary: AppColors.appColor,
    onPrimary: AppColors.black,
    onSecondary: AppColors.black,
    onBackground: AppColors.white,
    secondary: AppColors.white,
    onError: AppColors.white,
    surface: AppColors.grey,
  ),

);
