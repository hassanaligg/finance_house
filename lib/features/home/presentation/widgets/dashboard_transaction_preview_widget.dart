import 'package:finance_house/features/home/data/models/user_model.dart';
import 'package:finance_house/features/home/presentation/cubit/home_cubit.dart';
import 'package:finance_house/features/home/presentation/cubit/home_state.dart';
import 'package:finance_house/features/home/presentation/widgets/transactions_list_items.dart';
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
      return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.user!.transactions!.length,
          padding: EdgeInsets.only(top: 5.h),
          itemBuilder: (ctx, index) {
            Transaction transaction = state.user!.transactions![index];
            return TransactionsListItems(transactionItem: transaction);
          });
    });
  }
}
