
import 'package:finance_house/features/home/data/models/user_model.dart';
import 'package:finance_house/features/manage_beneficiary/data/models/user_summary.dart';

abstract class AddBeneficiaryState {}

class AddBeneficiaryInitial extends AddBeneficiaryState {}

class AddBeneficiaryLoading extends AddBeneficiaryState {}

class AddBeneficiaryLoaded extends AddBeneficiaryState {
  final UserSummary user;
  AddBeneficiaryLoaded(this.user);
}

class AddBeneficiaryError extends AddBeneficiaryState {
  final String message;
  AddBeneficiaryError(this.message);
}
class AddBeneficiaryAdded extends AddBeneficiaryState {
  final Beneficiary beneficiary;
  AddBeneficiaryAdded(this.beneficiary);
}