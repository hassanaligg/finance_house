import 'package:finance_house/common_widgets/initails_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:finance_house/resources/app_colors.dart';
import 'package:finance_house/resources/app_text_styles.dart';

class SharedAppBar extends StatelessWidget {
  final VoidCallback onAccountTap;
  final VoidCallback? onBack;
  final String name;
  final String title;

  const SharedAppBar({
    super.key,
    this.onBack,
    required this.onAccountTap,
    required this.name,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (onBack != null)
            GestureDetector(
              onTap: onBack,
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
              ),
            )
          else
            const SizedBox(),
          Text(
            title,
            style: AppTextStyles.textBold20.copyWith(color: AppColors.black),
          ),
          GestureDetector(
              onTap: onAccountTap,
              child: InitialsCard(
                name: name,
                radius: 18.sp,
                textStyle: AppTextStyles.textMedium14.copyWith(color: AppColors.white),
              )),
        ],
      ),
    );
  }
}
