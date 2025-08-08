import 'package:finance_house/common_widgets/custom_app_field.dart';
import 'package:finance_house/common_widgets/transparent_inkwell.dart';
import 'package:finance_house/core/validations/field_validators.dart';
import 'package:finance_house/features/transfer/presentation/cubit/transfer_cubit.dart';
import 'package:finance_house/features/transfer/presentation/widgets/transfer_top_up_options_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:finance_house/resources/app_colors.dart';
import 'package:finance_house/resources/app_text_styles.dart';

class TransferTopUpAmountSection extends StatelessWidget {
  const TransferTopUpAmountSection({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.amountController,
    required this.selectedAmount, required this.isVerified,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController amountController;
  final int? selectedAmount;
  final bool isVerified;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: CustomAppField(
            controller: amountController,
            hint: 'Enter Amount',
            label: 'Amount',
            borderType: BorderType.outlined,
            validator: AmountValidator("Amount",isVerified),
            keyboardType: TextInputType.number,
            validColor: AppColors.white,
            hintTextStyle: AppTextStyles.textMedium14,
            labelTextStyle: AppTextStyles.textMedium14,
            contentPadding: EdgeInsets.symmetric(
              vertical: 16.h,
              horizontal: 15.w,
            ),
            suffixIcon: TransparentInkWell(
              onTap: () {
                context.read<TransferCubit>().clearAmount();
              },
              child: const Icon(
                Icons.close,
                color: AppColors.greyColor,
              ),
            ),
            inputFormatter: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(4),
            ],
            onChange: (value) {
              context.read<TransferCubit>().onChangeValue(value);
            },
          ),
        ),
        SizedBox(height: 20.h),
        TransferTopUpOptionsWidget(selectedAmount: selectedAmount),
      ],
    );
  }
}
