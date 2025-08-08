import 'package:finance_house/common_widgets/transparent_inkwell.dart';
import 'package:finance_house/core/constants/app_constants.dart';
import 'package:finance_house/features/transfer/presentation/cubit/transfer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finance_house/resources/app_colors.dart';

class TransferTopUpOptionsWidget extends StatelessWidget {
  const TransferTopUpOptionsWidget({
    super.key,
    required this.selectedAmount,
  });

  final int? selectedAmount;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        alignment: WrapAlignment.center,
        children: AppConstants.topUpOptions.map((amount) {
          final isSelected = selectedAmount == amount;
          return TransparentInkWell(
            onTap: () {
              context.read<TransferCubit>().selectAmount(amount);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                border: Border.all(
                  color: isSelected ? AppColors.greyLight : Colors.transparent,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "AED $amount",
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
