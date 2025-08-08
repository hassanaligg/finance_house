import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart' show AppColors;

class AppTextStyles {
  AppTextStyles._();

  static TextStyle mediumBold = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.w600,
    fontSize: 14.sp,
  );

  static TextStyle get title48 {
    return GoogleFonts.plusJakartaSans(
      fontSize: 48.sp,
      height: 56 / 48,
      fontWeight: FontWeight.w700,
      color: AppColors.heading,
    );
  }

  static TextStyle get title36 {
    return GoogleFonts.plusJakartaSans(
      fontSize: 36.sp,
      height: 44 / 36,
      fontWeight: FontWeight.w700,
      color: AppColors.heading,
    );
  }

  static TextStyle get title25 {
    return GoogleFonts.plusJakartaSans(
      fontSize: 25.sp,
      height: 30 / 22,
      fontWeight: FontWeight.w600,
      color: AppColors.heading,
      letterSpacing: 0.5.sp,
    );
  }

  static TextStyle get title22 {
    return GoogleFonts.plusJakartaSans(
      fontSize: 22.sp,
      height: 30 / 22,
      fontWeight: FontWeight.w700,
      color: AppColors.heading,
    );
  }

  static TextStyle get title21 {
    return GoogleFonts.plusJakartaSans(
      fontSize: 21.sp,
      height: 28 / 21,
      fontWeight: FontWeight.w700,
      color: AppColors.heading,
    );
  }

  static TextStyle get title18 {
    return GoogleFonts.plusJakartaSans(
      fontSize: 18.sp,
      height: 24 / 18,
      fontWeight: FontWeight.w700,
      color: AppColors.heading,
    );
  }

  static TextStyle get textDefault17 {
    return GoogleFonts.inter(
      fontSize: 17.sp,
      height: 24 / 17,
      fontWeight: FontWeight.w400,
      color: AppColors.labelText,
      letterSpacing: 0.5.sp,
    );
  }

  static TextStyle get textDefault14 {
    return GoogleFonts.inter(
      fontSize: 14.sp,
      height: 20 / 14,
      fontWeight: FontWeight.w400,
      color: AppColors.greyColor,
    );
  }

  static TextStyle get textDefault13 {
    return GoogleFonts.inter(
      fontSize: 13.sp,
      height: 14.94 / 12,
      letterSpacing: 0.5.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.greyColor,
    );
  }

  static TextStyle get textRegular17 {
    return GoogleFonts.inter(
      fontSize: 17.sp,
      height: 24 / 17,
      fontWeight: FontWeight.w400,
      color: AppColors.labelText,
    );
  }

  static TextStyle get textRegular16 {
    return GoogleFonts.inter(
      fontSize: 16.sp,
      height: 22 / 16,
      fontWeight: FontWeight.w400,
      color: AppColors.labelText,
    );
  }

  static TextStyle get textRegular15 {
    return GoogleFonts.inter(
      fontSize: 15.sp,
      height: 20 / 15,
      fontWeight: FontWeight.w400,
      color: AppColors.labelText,
    );
  }

  static TextStyle get textRegular12 {
    return GoogleFonts.inter(
      fontSize: 12.sp,
      height: 16 / 12,
      fontWeight: FontWeight.w400,
      color: AppColors.labelText,
    );
  }

  static TextStyle get textMedium24 {
    return GoogleFonts.inter(
      fontSize: 24.sp,
      height: 32 / 24,
      fontWeight: FontWeight.w500,
      color: AppColors.labelText,
    );
  }

  static TextStyle get textMedium17 {
    return GoogleFonts.inter(
      fontSize: 17.sp,
      height: 24 / 17,
      fontWeight: FontWeight.w500,
      color: AppColors.labelText,
    );
  }

  static TextStyle get textMedium16 {
    return GoogleFonts.inter(
      fontSize: 16.sp,
      height: 22 / 16,
      fontWeight: FontWeight.w500,
      color: AppColors.labelText,
    );
  }

  static TextStyle get textMedium15 {
    return GoogleFonts.inter(
      fontSize: 15.sp,
      height: 20 / 15,
      fontWeight: FontWeight.w500,
      color: AppColors.labelText,
    );
  }

  static TextStyle get textMedium14 {
    return GoogleFonts.inter(
      fontSize: 14.sp,
      height: 20 / 14,
      fontWeight: FontWeight.w500,
      color: AppColors.greyColor,
    );
  }

  static TextStyle get textMedium13 {
    return GoogleFonts.inter(
      fontSize: 13.sp,
      height: 18 / 13,
      fontWeight: FontWeight.w500,
      color: AppColors.labelText,
    );
  }

  static TextStyle get textLight17 {
    return GoogleFonts.inter(
      fontSize: 17.sp,
      height: 24 / 17,
      fontWeight: FontWeight.w300,
      color: AppColors.labelText,
    );
  }

  static TextStyle get textSemi32 {
    return GoogleFonts.inter(
      fontSize: 32.sp,
      height: 40 / 32,
      fontWeight: FontWeight.w600,
      color: AppColors.heading,
    );
  }

  static TextStyle get textSemi18 {
    return GoogleFonts.inter(
      fontSize: 18.sp,
      height: 24 / 18,
      fontWeight: FontWeight.w600,
      color: AppColors.heading,
    );
  }

  static TextStyle get textSemi17 {
    return GoogleFonts.inter(
      fontSize: 17.sp,
      height: 24 / 17,
      fontWeight: FontWeight.w600,
      color: AppColors.heading,
    );
  }

  static TextStyle get textSemi16 {
    return GoogleFonts.inter(
      fontSize: 16.sp,
      height: 22 / 16,
      fontWeight: FontWeight.w600,
      color: AppColors.heading,
    );
  }

  static TextStyle get textSemi12 {
    return GoogleFonts.inter(
      fontSize: 12.sp,
      height: 16 / 12,
      fontWeight: FontWeight.w600,
      color: AppColors.heading,
    );
  }

  static TextStyle get textSemi11 {
    return GoogleFonts.inter(
      fontSize: 11.sp,
      height: 15 / 11,
      fontWeight: FontWeight.w600,
      color: AppColors.heading,
    );
  }

  static TextStyle get textBold20 {
    return GoogleFonts.inter(
      fontSize: 20.sp,
      height: 26 / 20,
      fontWeight: FontWeight.bold,
      color: AppColors.heading,
    );
  }

  static TextStyle get textBold18 {
    return GoogleFonts.inter(
      fontSize: 18.sp,
      height: 24 / 18,
      fontWeight: FontWeight.bold,
      color: AppColors.heading,
    );
  }

  static TextStyle get button17 {
    return GoogleFonts.plusJakartaSans(
      fontSize: 17.sp,
      height: 22 / 17,
      fontWeight: FontWeight.w500,
      color: AppColors.labelText,
    );
  }

  static TextStyle get button16 {
    return GoogleFonts.plusJakartaSans(
      fontSize: 16.sp,
      height: 22 / 16,
      fontWeight: FontWeight.w500,
      color: AppColors.labelText,
    );
  }

  static TextStyle get button15 {
    return GoogleFonts.plusJakartaSans(
      fontSize: 15.sp,
      height: 20 / 15,
      fontWeight: FontWeight.w500,
      color: AppColors.labelText,
    );
  }
}
