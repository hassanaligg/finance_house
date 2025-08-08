import 'package:finance_house/common_widgets/loading_wrapper.dart';
import 'package:finance_house/core/utils/toast_utils.dart';
import 'package:finance_house/features/home/domain/entitites/user_data.dart';
import 'package:finance_house/features/transfer/domain/dto/send_money_request.dart';
import 'package:finance_house/features/transfer/presentation/cubit/transfer_state.dart';
import 'package:finance_house/features/transfer/presentation/widgets/transfer_page_body.dart';
import 'package:finance_house/features/transfer/presentation/widgets/transfer_page_footer.dart';
import 'package:flutter/material.dart';
import 'package:finance_house/features/transfer/presentation/cubit/transfer_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class TransferScreen extends HookWidget {
  final UserData userData;

  final TextEditingController amountController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  TransferScreen(this.userData, {super.key});

  @override
  Widget build(BuildContext context) {
    final footerKey = useMemoized(() => GlobalKey());
    final footerHeight = useState<double>(0);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final box = footerKey.currentContext?.findRenderObject() as RenderBox?;
        if (box != null) {
          footerHeight.value = box.size.height;
        }
      });
      return null;
    }, []);
    return LoadingWrapper(
      child: BlocConsumer<TransferCubit, TransferState>(
        listener: (context, state) {
          if (state is TransferLoaded) {
            amountController.text = state.selectedAmount?.toString() ?? '';
          }
        },
        builder: (context, state) {
          final selectedAmount =
              state is TransferLoaded ? state.selectedAmount : null;
          return Scaffold(
            body: SafeArea(
              bottom: false,
              child: TransferPageBody(
                  formKey: _formKey,
                  amountController: amountController,
                  selectedAmount: selectedAmount,
                  footerHeight: footerHeight.value,
                  userData: userData),
            ),
            bottomSheet: TransferPageFooter(
              footerKey: footerKey,
              selectedAmount: selectedAmount,
              formKey: _formKey,
              onTransferTap: ()async {
                if(userData.topupLimit<=0){
                  showToast(message: "TopUp Limit Exceed", type: AlertType.error);
                }else if(selectedAmount!+3>userData.beneficiary.limit!){
                  showToast(message: "Beneficiary topUp limit Exceed", type: AlertType.error);
                }
                else if(selectedAmount+3>userData.balance){
                  showToast(message: "Beneficiary topUp limit Exceed", type: AlertType.error);
                }

                else {
                  final lc = context.read<LoadingCubit>();
                  lc.showLoading();
                  await context.read<TransferCubit>().transferAmount(SendMoneyRequest(
                      userId: userData.id,
                      beneficiaryId: userData.beneficiary.id!,
                      amount: selectedAmount+3));//+3 fee we can mange it from beckend as well
                  lc.hideLoading();
                  GoRouter.of(context).pop(true);
                }
              },
            ),
          );
        },
      ),
    );
  }
}
