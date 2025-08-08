import 'package:finance_house/core/types/typedefs.dart';
import 'package:finance_house/features/home/data/models/user_model.dart';
import 'package:finance_house/features/manage_beneficiary/data/models/user_summary.dart';
import 'package:finance_house/features/manage_beneficiary/domain/dto/add_benef_request.dart';

abstract class AddBeneficiaryDataSource {
  Future<EitherResponse<UserSummary>> getUserInfo(String phNo);

  Future<EitherResponse<Beneficiary>> addBeneficiary(
      AddBeneficiaryRequest request);
}
