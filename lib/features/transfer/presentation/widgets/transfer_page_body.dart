import 'package:finance_house/common_widgets/shared_app_bar.dart';
import 'package:finance_house/features/home/domain/entitites/user_data.dart';
import 'package:finance_house/features/transfer/presentation/widgets/transfer_account_picker_section.dart';
import 'package:finance_house/features/transfer/presentation/widgets/transfer_top_up_amount_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransferPageBody extends StatelessWidget {
  const TransferPageBody({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.amountController,
    required this.selectedAmount,
    required this.footerHeight,
    required this.userData,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController amountController;
  final int? selectedAmount;
  final double footerHeight;
  final UserData userData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SharedAppBar(
          name: userData.name,
          title: 'Transfer',
          onAccountTap: () {},
          onBack: () => Navigator.pop(context),
        ),
        Flexible(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   TransferAccountPickerSection(userData:userData
                  ),
                  SizedBox(height: 60.h),
                  TransferTopUpAmountSection(
                      formKey: _formKey,
                      amountController: amountController,
                      selectedAmount: selectedAmount,
                      isVerified:userData.isVerified
                  ),
                  SizedBox(height: footerHeight + 160.h)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
