import 'package:finance_house/common_widgets/custom_divider.dart';
import 'package:finance_house/common_widgets/loading_wrapper.dart';
import 'package:finance_house/features/home/presentation/cubit/home_cubit.dart';
import 'package:finance_house/features/home/presentation/cubit/home_state.dart';
import 'package:finance_house/features/home/presentation/widgets/dashboard_beneficiary_widget.dart';
import 'package:finance_house/features/home/presentation/widgets/dashboard_transaction_preview_widget.dart';
import 'package:finance_house/features/home/presentation/widgets/total_balance_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:finance_house/common_widgets/shared_app_bar.dart';
import 'package:finance_house/resources/app_colors.dart';
import 'package:finance_house/resources/app_text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      if (state.status == HomeStatus.loading || state.user == null) {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      }

      return LoadingWrapper(
        child: Scaffold(
          body: Column(
            children: [
              SizedBox(height: 40.h),
              SharedAppBar(
                onAccountTap: () {},
                name: state.user!.name!,
                title: 'Dashboard',
              ),
              SizedBox(height: 20.h),
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TotalBalanceWidget(
                              balance: (state.user?.balance ?? 0.0).toString(),
                            ),
                            const CustomDivider(),
                            const DashboardBeneficiaryWidget(),
                            const CustomDivider(),
                            SizedBox(height: 10.h),
                            Text(
                              "TRANSACTIONS",
                              style: AppTextStyles.textMedium14.copyWith(
                                color: AppColors.greyColor,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            const DashboardTransactionsPreviewWidget(),
                            SizedBox(height: 10.h),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
