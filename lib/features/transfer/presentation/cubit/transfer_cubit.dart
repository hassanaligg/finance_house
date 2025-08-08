import 'package:bloc/bloc.dart';
import 'package:finance_house/core/utils/toast_utils.dart';
import 'package:finance_house/features/transfer/domain/dto/send_money_request.dart';
import 'package:finance_house/features/transfer/domain/repositories/transfer_repository.dart';
import 'package:finance_house/features/transfer/presentation/cubit/transfer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class TransferCubit extends Cubit<TransferState> {
  final TransferRepository repository;

  TransferCubit(this.repository) : super(TransferInitial());

  void selectAmount(int amount) => emit(TransferLoaded(amount));

  void clearAmount() => emit(TransferLoaded(null));

  void onChangeValue(String value) {
    if (value == "") {
      emit(TransferLoaded(null));
    } else {
      emit(TransferLoaded(int.parse(value)));
    }
  }

  Future<void> transferAmount(SendMoneyRequest requestModel) async {
    final result = await repository.transferMoney(
        requestModel);

    result.fold(
      (failure) {
        showToast(message: "Topup Failed", type: AlertType.error);
      },
      (response) {
        showToast(message: "Topup Successfull", type: AlertType.success);
      },
    );
  }
}
