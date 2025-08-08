import 'package:finance_house/common_widgets/loading_wrapper.dart';
import 'package:finance_house/common_widgets/transparent_inkwell.dart';
import 'package:finance_house/features/home/data/models/user_model.dart';
import 'package:finance_house/features/home/domain/entitites/user_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:finance_house/features/home/presentation/cubit/home_cubit.dart';
import 'package:finance_house/features/home/presentation/cubit/home_state.dart';
import 'package:finance_house/features/home/presentation/widgets/benefciary_list_item.dart';
import 'package:finance_house/resources/app_colors.dart';
import 'package:finance_house/resources/app_text_styles.dart';
import 'package:finance_house/routes/app_routes.dart';

class DashboardBeneficiaryWidget extends StatelessWidget {
  const DashboardBeneficiaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      final list = state.user?.beneficiaries ?? [];

      return Column(
        children: [
          // header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "BENEFICIARY",
                style: AppTextStyles.textMedium14.copyWith(
                  color: AppColors.greyColor,
                ),
              ),
              const Spacer(),
              TransparentInkWell(
                onTap: () async {
                  final Beneficiary? newBen = await context.push<Beneficiary?>(
                      AppRoutes.addBeneficiary,
                      extra: state.user);
                  if (newBen != null) {
                    context.read<HomeCubit>().addBeneficiaryLocal(newBen);
                  }
                },
                child: Icon(Icons.add, color: AppColors.greyColor, size: 24.sp),
              ),
            ],
          ),
          SizedBox(height: 10.h),

          if (list.isEmpty)
            Center(
              child: Text(
                "No Beneficiary Added",
                style: AppTextStyles.textMedium14,
              ),
            )
          else
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: list.length,
              padding: EdgeInsets.only(top: 5.h),
              itemBuilder: (ctx, index) {
                final currentItem = list[index];
                final userId = state.user?.id;
                final benId = currentItem.id;

                return Dismissible(
                  key: ValueKey(benId ?? index),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 20.w),
                    color: Colors.red,
                    child: Icon(Icons.delete, color: Colors.white),
                  ),
                  confirmDismiss: (_) async {
                    if (userId == null || benId == null) return false;
                    context.read<LoadingCubit>().showLoading();
                    final success = await context
                        .read<HomeCubit>()
                        .deleteBeneficiary(userId, benId);
                    context.read<LoadingCubit>().hideLoading();

                    return success;
                  },
                  child: TransparentInkWell(
                    onTap: () async {
                      final bool? didTransfer = await context.push<bool>(
                        AppRoutes.transfer,
                        extra: UserData(
                          id: state.user!.id!,
                          name: state.user!.name!,
                          phone: state.user!.phone!,
                          balance: state.user!.balance!,
                          topupLimit: state.user!.topupLimit!,
                          isVerified: state.user!.isVerified!,
                          beneficiary: currentItem,
                        ),
                      );

                      if (didTransfer == true) {
                        context.read<HomeCubit>().getUserDetails();
                      }
                    },
                    child: BeneficiaryListItem(model: currentItem),
                  ),
                );
              },
            )
        ],
      );
    });
  }
}

/*
class DashboardBeneficiaryWidget extends StatelessWidget {
  const DashboardBeneficiaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "BENEFICIARY",
              style: AppTextStyles.textMedium14.copyWith(
                color: AppColors.greyColor,
              ),
            ),
            const Spacer(),
            TransparentInkWell(
              onTap: () async {
                final Beneficiary? newBen = await context.push<Beneficiary?>(
                  AppRoutes.addBeneficiary,
                );
                if (newBen != null) {
                  context.read<HomeCubit>().addBeneficiaryLocal(newBen);
                }
              },
              child: Icon(Icons.add, color: AppColors.greyColor, size: 24.sp),
            ),
          ],
        ),
        SizedBox(height: 10.h),

        // list
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            final list = state.user?.beneficiaries ?? [];
            if (list.isEmpty) return SizedBox();

            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: list.length,
              padding: EdgeInsets.only(top: 5.h),
              itemBuilder: (ctx, index) {
                final currentItem = list[index];
                final userId = state.user?.id;
                final benId = currentItem.id;

                return Dismissible(
                  key: ValueKey(benId ?? index),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 20.w),
                    color: Colors.red,
                    child: Icon(Icons.delete, color: Colors.white),
                  ),
                  confirmDismiss: (_) async {
                    if (userId == null || benId == null) return false;
                    context.read<LoadingCubit>().showLoading();
                    final success = await context
                        .read<HomeCubit>()
                        .deleteBeneficiary(userId, benId);
                    context.read<LoadingCubit>().hideLoading();

                    return success;
                  },
                  child: TransparentInkWell(
                    onTap: () async{

                      final bool? didTransfer = await context.push<bool>(
                        AppRoutes.transfer,
                        extra: UserData(
                          id:           state.user!.id!,
                          name:         state.user!.name!,
                          phone:        state.user!.phone!,
                          balance:      state.user!.balance!,
                          topupLimit:   state.user!.topupLimit!,
                          isVerified:   state.user!.isVerified!,
                          beneficiary:  currentItem,
                        ),
                      );

                      if (didTransfer == true) {
                        context
                            .read<HomeCubit>().getUserDetails();
                      }
                    },
                    child: BeneficiaryListItem(model: currentItem),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
*/
