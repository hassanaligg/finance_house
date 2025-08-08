import 'package:flutter/material.dart';
import 'package:finance_house/resources/app_colors.dart';

BoxDecoration iconButtonGrey(double radius,
    {Color? color = AppColors.bgGreyLight}) {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      color: color,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 6,
          offset: Offset(0, 3), // Shadow position
        ),
      ],
      border: Border.all(
        color: AppColors.borderColor,
      ));
}

BoxDecoration buttonDecoration(bool isValid, double radius) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    color: isValid ? AppColors.primary : AppColors.primaryDim,
    boxShadow: [
      if (isValid)
        BoxShadow(
          color: AppColors.primary.withOpacity(0.3),
          spreadRadius: 3,
          blurRadius: 3,
          offset: const Offset(0, 3),
        ),
    ],
  );
}

