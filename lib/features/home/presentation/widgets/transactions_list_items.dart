import 'package:finance_house/core/extensions/date_time_extension.dart';
import 'package:finance_house/features/home/data/models/user_model.dart';
import 'package:finance_house/features/home/presentation/enums/transaction_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:finance_house/common_widgets/icon_button.dart';
import 'package:finance_house/resources/box_decorations.dart';

import '../../../../resources/app_colors.dart';
import '../../../../resources/app_text_styles.dart';
import '../../../../resources/assets.gen.dart';

class TransactionsListItems extends StatelessWidget {
  final Transaction transactionItem;

  const TransactionsListItems({super.key, required this.transactionItem});

  @override
  Widget build(BuildContext context) {
    String icon = Assets.icons.incoming;
    Color? color = AppColors.white;
    switch (transactionItem.direction) {
      case TransactionType.incoming:
        icon = Assets.icons.incoming;
        break;
      case TransactionType.outgoing:
        icon = Assets.icons.depositWhite;
        color = AppColors.primary.withValues(alpha: 0.7);
        break;
      case TransactionType.withdraw:
        icon = Assets.icons.transfering;
        break;
    }
    return Column(
      children: [
        Row(
          children: [
            AppIconButton(
              icon: icon,
              padding: EdgeInsets.all(12.sp),
              decoration: iconButtonGrey(10.r, color: color),
              onTap: () {},
              size: 15.sp,
            ),
            SizedBox(width: 20.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    transactionItem.beneficiaryNickname!,
                    style: AppTextStyles.textMedium15,
                  ),
                  Text(
                    transactionItem.direction!,
                    style: AppTextStyles.textDefault13
                        .copyWith(color: AppColors.greyColor),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                  "+ ${(transactionItem.amount! - 3.0).toStringAsFixed(2)} AED", //bug in beckend it add the transaction fee also
                    style: AppTextStyles.textMedium15
                        .copyWith(color: AppColors.green),
                  ),
                  Text(
                    transactionItem.timestamp!.toDateString(),
                    style: AppTextStyles.textDefault13
                        .copyWith(color: AppColors.greyColor),
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}
