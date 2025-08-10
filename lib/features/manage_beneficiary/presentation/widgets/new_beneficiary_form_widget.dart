import 'package:finance_house/common_widgets/custom_app_field.dart';
import 'package:finance_house/core/validations/field_validators.dart';
import 'package:finance_house/resources/app_colors.dart';
import 'package:finance_house/resources/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewBeneficiaryFormWidget extends StatelessWidget {
  const NewBeneficiaryFormWidget({
    super.key,
    required this.phoneNoController,
    required this.isLoaded,
    required this.nameController,
    required this.nickNameController,
  });

  final TextEditingController phoneNoController;
  final bool isLoaded;
  final TextEditingController nameController;
  final TextEditingController nickNameController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomAppField(
            controller: phoneNoController,
            hint: 'Enter phone number',
            label: 'Phone Number',
            borderType: BorderType.outlined,
            keyboardType: TextInputType.number,
            validColor: AppColors.white,
            isDisabled: isLoaded,
            validator: PhoneNumberValidator("Phone No"),
            hintTextStyle: AppTextStyles.textMedium14,
            labelTextStyle: AppTextStyles.textMedium14,
            inputFormatter: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(9),
            ],
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('🇦🇪+971', style: AppTextStyles.textMedium14),
                ],
              ),
            ),
            onChange: (v) {},
          ),
          Visibility(
            visible: isLoaded,
            child: Column(
              children: [
                SizedBox(height: 25.h),
                CustomAppField(
                  controller: nameController,
                  hint: 'Name',
                  label: 'Name',
                  borderType: BorderType.outlined,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
                  validator: RequiredFieldValidator("Name"),
                  isDisabled: true,
                  onChange: (v) {},
                ),
                SizedBox(height: 25.h),
                CustomAppField(
                  controller: nickNameController,
                  hint: 'Enter NickName',
                  label: 'Choose NickName',
                  borderType: BorderType.outlined,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
                  inputFormatter: [LengthLimitingTextInputFormatter(20)],
                  validator: RequiredFieldValidator("Nick Name"),
                  onChange: (v) {},
                ),
              ],
            ),
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}
