import 'package:finance_house/core/utils/toast_utils.dart';
import 'package:finance_house/features/manage_beneficiary/domain/dto/add_benef_request.dart';
import 'package:finance_house/features/manage_beneficiary/domain/repositories/add_benef_repository.dart';
import 'package:finance_house/features/manage_beneficiary/presentation/cubit/add_benef_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';


@injectable
class AddBeneficiaryCubit extends Cubit<AddBeneficiaryState> {
  final AddBeneficiaryRepository repository;
  AddBeneficiaryCubit(this.repository) : super(AddBeneficiaryInitial());

  Future<void> getBeneficiary(String phone) async {
    emit(AddBeneficiaryLoading());
    final result = await repository.getUserInfo(phone);
    result.fold(
          (failure) {
        showToast(message: "Failed: $failure", type: AlertType.error);
        emit(AddBeneficiaryError(failure));
      },
          (response) {
        final user = response.data;
        showToast(message: "Found: ${user!.name}", type: AlertType.success);
        emit(AddBeneficiaryLoaded(user));
      },
    );
  }
    Future<void> addBeneficiary(AddBeneficiaryRequest request) async {
    final result = await repository.addBeneficiary(request);
    result.fold(
          (failure) {
        showToast(message: "Failed: $failure", type: AlertType.error);
        emit(AddBeneficiaryError(failure));
      },
          (response) {
        final beneficiary = response.data;
        showToast(message: "Added: ${beneficiary!.name}", type: AlertType.success);
        emit(AddBeneficiaryAdded(beneficiary));
      },
    );
  }
}

