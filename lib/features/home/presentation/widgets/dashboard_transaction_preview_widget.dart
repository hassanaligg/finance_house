import 'package:finance_house/features/home/data/models/user_model.dart';
import 'package:finance_house/features/home/presentation/cubit/home_cubit.dart';
import 'package:finance_house/features/home/presentation/cubit/home_state.dart';
import 'package:finance_house/features/home/presentation/widgets/transactions_list_items.dart';
import 'package:finance_house/resources/app_colors.dart';
import 'package:finance_house/resources/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardTransactionsPreviewWidget extends StatelessWidget {
  const DashboardTransactionsPreviewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Text(
              "TRANSACTIONS",
              style: AppTextStyles.textMedium14.copyWith(
                color: AppColors.greyColor,
              ),
            ),
          ),
          if (state.user?.transactions?.isEmpty ?? true)
            Center(
              child: Text(
                "No Beneficiary Added",
                style: AppTextStyles.textMedium14,
              ),
            )
          else
            ListView.builder(
                shrinkWrap: true,
                reverse: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.user!.transactions!.length,
                padding: EdgeInsets.only(top: 5.h),
                itemBuilder: (ctx, index) {
                  Transaction transaction = state.user!.transactions![index];
                  return TransactionsListItems(transactionItem: transaction);
                }),
        ],
      );
    });
  }
}
