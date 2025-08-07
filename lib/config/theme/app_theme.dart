import 'package:flutter/material.dart';
import 'package:websocket_example/config/theme/app_colors.dart';

final appTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primaryContainer,
    primaryContainer: AppColors.primaryContainer,
    secondaryContainer: AppColors.secondaryContainer,
    surface: AppColors.bodyColor,
  ),
  scaffoldBackgroundColor: AppColors.bodyColor,
  shadowColor: AppColors.lettersAndIcons,
  hintColor: AppColors.blueButton,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.backgroundLightMode,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: AppColors.lettersAndIcons,
    ),
    titleLarge: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.lettersAndIcons,
    ),
    titleMedium: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: AppColors.lettersAndIcons,
    ),
    titleSmall: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: AppColors.lettersAndIcons,
    ),
  ),
);
