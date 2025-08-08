import 'package:finance_house/features/home/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:finance_house/common_widgets/initails_card.dart';
import 'package:finance_house/resources/app_colors.dart';
import 'package:finance_house/resources/app_text_styles.dart';

class BeneficiaryListItem extends StatelessWidget {
  final Beneficiary model;
  final Color? color;

  const BeneficiaryListItem({super.key, required this.model ,this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            InitialsCard(
              name: model.name!,
              radius: 12.sp,
              bgColor: color ?? AppColors.white,
            ),
            SizedBox(
              width: 20.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.nickname!,
                  style: AppTextStyles.textMedium15,
                ),
                Text(
                  model.phone!,
                  style: AppTextStyles.textDefault13
                      .copyWith(color: AppColors.greyColor),
                ),
              ],
            ),
            Spacer(),
            GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.keyboard_double_arrow_right_sharp,
                size: 18.sp,
                color: AppColors.primary,
              ),
            )
          ],
        ),
        SizedBox(
          height: 15.h,
        ),
      ],
    );
  }
}

