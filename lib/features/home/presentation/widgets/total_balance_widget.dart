import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:finance_house/features/home/presentation/cubit/home_cubit.dart';
import 'package:finance_house/features/home/presentation/cubit/home_state.dart';
import 'package:finance_house/resources/app_colors.dart';
import 'package:finance_house/resources/app_text_styles.dart';

class TotalBalanceWidget extends StatelessWidget {
  final String balance;

  const TotalBalanceWidget({super.key, required this.balance});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Total Balance",
          style: AppTextStyles.textDefault17,
        ),
        SizedBox(height: 5.h),
        Row(
          children: [
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return ImageFiltered(
                  imageFilter: ImageFilter.blur(
                    sigmaX: state.blurXValue,
                    sigmaY: state.blurYValue,
                  ),
                  child: Text(
                    balance,
                    style: AppTextStyles.title25,
                  ),
                );
              },
            ),
            SizedBox(width: 15.w),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return IconButton(
                  icon: Icon(
                    state.isBalanceVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    size: 24.sp,
                    color: AppColors.black,
                  ),
                  onPressed: () {
                    context.read<HomeCubit>().toggleVisibility();
                  },
                );
              },
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),

      ],
    );
  }
}
