import 'package:finance_house/features/home/domain/entitites/user_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:finance_house/common_widgets/initails_card.dart';
import 'package:finance_house/resources/app_colors.dart';
import 'package:finance_house/resources/app_text_styles.dart';

class TransferAccountPickerSection extends StatelessWidget {
  const TransferAccountPickerSection({
    super.key,
    required this.userData,
  });

  final UserData userData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.h),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.primary,
                    AppColors.primaryLight,
                  ],
                ),
                borderRadius: BorderRadius.circular(16.sp),
                border: Border.all(
                  width: 1.w,
                  color: AppColors.primary.withValues(alpha: 0.5),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'FROM',
                    style: AppTextStyles.textSemi11
                        .copyWith(color: AppColors.labelText),
                  ),
                  Row(
                    children: [
                      InitialsCard(
                        name: userData.name,
                        radius: 12.sp,
                        textStyle: AppTextStyles.textMedium14
                            .copyWith(color: AppColors.labelText),
                        bgColor: AppColors.primaryLight,
                        padding: EdgeInsets.all(12.sp),
                      ),
                      SizedBox(width: 16.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'CURRENT ACCOUNT',
                            style: AppTextStyles.mediumBold,
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            userData.phone,
                            style: AppTextStyles.textSemi11
                                .copyWith(color: AppColors.labelText),
                          ),
                          Row(
                            children: [
                              Text(
                                userData.balance.toString(),
                                style: AppTextStyles.textSemi11
                                    .copyWith(color: AppColors.labelText),
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                'AED',
                                style: AppTextStyles.textBold18.copyWith(
                                    color: AppColors.labelText,
                                    fontSize: 14.sp),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 5.h),
          ],
        ),
        SizedBox(height: 8.h),
        Container(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.primaryLight,
                AppColors.white,
              ],
            ),
            borderRadius: BorderRadius.circular(16.sp),
            border: Border.all(
              width: 1.w,
              color: AppColors.primary.withValues(alpha: 0.5),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'TO',
                style: AppTextStyles.textSemi11
                    .copyWith(color: AppColors.labelText),
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  InitialsCard(
                    name: userData.beneficiary.name.toString(),
                    radius: 12.sp,
                    textStyle: AppTextStyles.textMedium14
                        .copyWith(color: AppColors.labelText),
                    bgColor: AppColors.primary.withValues(alpha: 0.3),
                    padding: EdgeInsets.all(12.sp),
                  ),
                  SizedBox(width: 16.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userData.beneficiary.name.toString(),
                        style: AppTextStyles.mediumBold,
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        userData.beneficiary.phone.toString(),
                        style: AppTextStyles.textSemi11
                            .copyWith(color: AppColors.labelText),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 5.h),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
          decoration: BoxDecoration(
              color: AppColors.primaryLight.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(4.sp)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Beneficiary Monthly Limit: ',
                style: AppTextStyles.textSemi11
                    .copyWith(color: AppColors.labelText),
              ),
              Text(
                '${userData.beneficiary.limit.toString()} AED',
                style: AppTextStyles.textSemi11
                    .copyWith(color: AppColors.labelText),
              ),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
          decoration: BoxDecoration(
              color: AppColors.primaryLight.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(4.sp)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Monthly Limit: ',
                style: AppTextStyles.textSemi11
                    .copyWith(color: AppColors.labelText),
              ),
              Text(
                '${userData.topupLimit.toString()} AED',
                style: AppTextStyles.textSemi11
                    .copyWith(color: AppColors.labelText),
              ),
            ],
          ),
        )
      ],
    );
  }
}
