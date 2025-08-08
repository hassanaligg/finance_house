import 'package:finance_house/core/types/typedefs.dart';

import 'package:finance_house/features/home/data/models/user_model.dart';
import 'package:finance_house/features/home/domain/dto/remove_benef_request.dart';

abstract class HomeRepository{
  Future<EitherResponse<User>> getUserDetails(String phNo);
  Future<EitherResponse<void>> deleteBeneficiary(RemoveBeneficiaryRequest request);
}