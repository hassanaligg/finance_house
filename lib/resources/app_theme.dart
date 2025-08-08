import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:finance_house/resources/app_colors.dart';

ThemeData appThemeData() {
  final baseTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: Colors.white,

    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColors.primaryXLight,
      primary: AppColors.primary,
      surfaceTint: Colors.transparent,
      onPrimary: Colors.white,
    ),
    fontFamily: 'Helvetica',

    textTheme:  TextTheme(
      displayLarge: TextStyle(fontSize: 72.0.sp, fontWeight: FontWeight.bold),
      displayMedium: TextStyle(fontSize: 36.0.sp, fontStyle: FontStyle.italic),
      displaySmall: TextStyle(fontSize: 14.0.sp),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
    ),
    iconTheme: const IconThemeData(
      color: AppColors.secondary,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      prefixIconColor: AppColors.secondary,
    ),
    checkboxTheme: const CheckboxThemeData(
      fillColor: WidgetStatePropertyAll(
        AppColors.white,
      ),
    ),
  );

  return baseTheme;
}
