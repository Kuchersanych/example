import 'package:example/app_colors.dart';
import 'package:flutter/material.dart';

/// Класс темы приложения.

ThemeData appTheme () => ThemeData(
  appBarTheme: const AppBarTheme(
    color: AppColors.appBarColor,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.w600,
      color: AppColors.titleAppBarColor,
    ),
    actionsIconTheme: IconThemeData(
      color: AppColors.buttonSearchColor,
      size: 40.0,
    ),
  ),
  scaffoldBackgroundColor: AppColors.backgroundColor,
);