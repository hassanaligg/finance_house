import 'package:finance_house/common_widgets/app_button.dart';
import 'package:finance_house/common_widgets/custom_app_bar.dart';
import 'package:finance_house/common_widgets/loading_wrapper.dart';
import 'package:finance_house/core/di/app_bindings.dart';
import 'package:finance_house/core/utils/toast_utils.dart';
import 'package:finance_house/features/home/data/models/user_model.dart';
import 'package:finance_house/features/manage_beneficiary/domain/dto/add_benef_request.dart';
import 'package:finance_house/features/manage_beneficiary/presentation/cubit/add_benef_cubit.dart';
import 'package:finance_house/features/manage_beneficiary/presentation/cubit/add_benef_state.dart';
import 'package:finance_house/features/manage_beneficiary/presentation/widgets/new_beneficiary_form_widget.dart';
import 'package:finance_house/resources/app_colors.dart';
import 'package:finance_house/resources/app_text_styles.dart';
import 'package:finance_house/resources/box_decorations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AddBeneficiaryPage extends StatelessWidget {
  final User userModel;

  AddBeneficiaryPage({super.key, required this.userModel});

  final _formKey = GlobalKey<FormState>();
  final phoneNoController = TextEditingController();
  final nameController = TextEditingController();
  final nickNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AddBeneficiaryCubit>(),
      child: BlocConsumer<AddBeneficiaryCubit, AddBeneficiaryState>(
        listener: (ctx, state) {
          if (state is AddBeneficiaryAdded) {
            GoRouter.of(context).pop(state.beneficiary);
          }
        },
        builder: (ctx, state) {
          final isInitial =
              state is AddBeneficiaryInitial || state is AddBeneficiaryError;
          final isLoading = state is AddBeneficiaryLoading;
          final isLoaded = state is AddBeneficiaryLoaded;

          if (state is AddBeneficiaryLoaded) {
            nameController.text = state.user.name;
          }

          return LoadingWrapper(
            child: Scaffold(
              appBar: const CustomAppBar(title: "Add Beneficiary"),
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40.h),
                      Flexible(
                        fit: FlexFit.tight,
                        child: NewBeneficiaryFormWidget(
                            phoneNoController: phoneNoController,
                            isLoaded: isLoaded,
                            nameController: nameController,
                            nickNameController: nickNameController),
                      ),
                      //const Spacer(),
                      AppButton(
                        onClick: () {
                          if (isLoading) return;

                          loadAndAddBeneficiary(
                              ctx, isInitial, isLoaded, userModel.phone ?? '');
                        },
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        decoration: buttonDecoration(true, 12),
                        textStyle: AppTextStyles.textMedium17
                            .copyWith(color: AppColors.white),
                        text: isLoading
                            ? ""
                            : (isLoaded ? "Add Beneficiary" : "Next"),
                      ),
                      SizedBox(height: 30.h),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void loadAndAddBeneficiary(BuildContext context, bool isInitial,
      bool isLoaded, String userPhone) async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    final loadingCubit = context.read<LoadingCubit>();

    final addBeneficiaryCubit = context.read<AddBeneficiaryCubit>();
    final phone = "+971${phoneNoController.text}";

    if (userModel.phone == phone) {
      showToast(
          message: "You don't have permission for this action",
          type: AlertType.error);
      return;
    } else if (userModel.beneficiaries?.any((b) => b.phone == phone) ?? false) {
      showToast(message: "Beneficiary Already Added", type: AlertType.error);
      return;
    }
    loadingCubit.showLoading();

    if (isInitial) {
      await addBeneficiaryCubit.getBeneficiary(phone);
    } else if (isLoaded) {
      await addBeneficiaryCubit.addBeneficiary(
        AddBeneficiaryRequest(
          userPhone: userPhone,
          beneficiaryPhone: phone,
          nickname: nickNameController.text,
        ),
      );
    }

    loadingCubit.hideLoading();
  }
}
