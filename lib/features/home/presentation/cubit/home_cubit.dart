import 'package:finance_house/core/utils/toast_utils.dart';
import 'package:finance_house/features/home/data/models/user_model.dart';
import 'package:finance_house/features/home/domain/dto/remove_benef_request.dart';
import 'package:finance_house/features/home/domain/repositories/home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finance_house/features/home/presentation/cubit/home_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final HomeRepository repository;

  HomeCubit(this.repository) : super(HomeState.initial()) {
    getUserDetails();
  }

  void toggleVisibility() {
    emit(state.copyWith(
      isBalanceVisible: !state.isBalanceVisible,
      blurXValue: state.isBalanceVisible ? 0.0 : 10.0,
      blurYValue: state.isBalanceVisible ? 0.0 : 10.0,
    ));
  }

  Future<void> getUserDetails() async {
    emit(state.copyWith(status: HomeStatus.loading, errorMessage: null));

    final result = await repository.getUserDetails("+971557122464");

    result.fold(
      (failure) {
        emit(state.copyWith(
          status: HomeStatus.error,
          errorMessage: failure,
        ));
      },
      (response) {
        emit(state.copyWith(
          status: HomeStatus.loaded,
          user: response.data,
        ));
      },
    );
  }

  Future<bool> deleteBeneficiary(String userId, String beneficiaryId) async {
    final result = await repository.deleteBeneficiary(
        RemoveBeneficiaryRequest(userId: userId, beneficiaryId: beneficiaryId));

    result.fold(
      (failure) {
        showToast(message: failure, type: AlertType.error);
        return false;
      },
      (response) {
        final updatedList = state.user!.beneficiaries!
            .where((b) => b.id != beneficiaryId)
            .toList();
        final newUser = state.user!.copyWith(beneficiaries: updatedList);
        emit(state.copyWith(user: newUser));
        showToast(message: response.message!, type: AlertType.success);
        return true;
      },
    );
    return false;
  }

  void addBeneficiaryLocal(Beneficiary ben) {
    final old = state.user!;
    final updated = [...old.beneficiaries!, ben];
    final newUser = old.copyWith(beneficiaries: updated);
    emit(state.copyWith(user: newUser));
  }
}
