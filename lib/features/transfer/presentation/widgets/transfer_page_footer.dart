import 'package:finance_house/common_widgets/app_button.dart';
import 'package:finance_house/resources/box_decorations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:finance_house/resources/app_colors.dart';
import 'package:finance_house/resources/app_text_styles.dart';

class TransferPageFooter extends StatelessWidget {
  const TransferPageFooter({
    super.key,
    required GlobalKey<State<StatefulWidget>> footerKey,
    required this.selectedAmount,
    required GlobalKey<FormState> formKey,
    required this.onTransferTap,
  })  : _footerKey = footerKey,
        _formKey = formKey;

  final GlobalKey<State<StatefulWidget>> _footerKey;
  final int? selectedAmount;
  final GlobalKey<FormState> _formKey;
  final VoidCallback onTransferTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _footerKey,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withValues(alpha: 0.4),
          spreadRadius: 1,
          blurRadius: 3,
        ),
      ], color: AppColors.white),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Transaction Amount",
                  style: AppTextStyles.textRegular12
                      .copyWith(color: AppColors.greyColor),
                ),
                Row(
                  children: [
                    Text(
                      (selectedAmount ?? 0).toStringAsFixed(2),
                      style: AppTextStyles.textMedium14
                          .copyWith(color: AppColors.labelText),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "AED",
                      style: AppTextStyles.textRegular12
                          .copyWith(color: AppColors.labelText),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Transfer Fee",
                      style: AppTextStyles.textRegular12
                          .copyWith(color: AppColors.greyColor),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text("3.00 AED", style: AppTextStyles.textRegular12),
                  ],
                ),
              ],
            ),
            const Spacer(),
            AppButton(
              height: 50.h,
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
              onClick: () {
                if (_formKey.currentState?.validate() ?? false) {
                  onTransferTap();
                } else {
                  debugPrint("Form is not valid");
                }
              },
              text: "Transfer",
              decoration: buttonDecoration(true, 10),
              textStyle: AppTextStyles.textMedium13.copyWith(
                color: AppColors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
