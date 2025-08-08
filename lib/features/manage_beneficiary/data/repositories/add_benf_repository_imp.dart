import 'package:finance_house/core/types/typedefs.dart';
import 'package:finance_house/features/home/data/models/user_model.dart';
import 'package:finance_house/features/manage_beneficiary/data/datasource/remote_datasource/add_benf_data_source.dart';
import 'package:finance_house/features/manage_beneficiary/data/models/user_summary.dart';
import 'package:finance_house/features/manage_beneficiary/domain/dto/add_benef_request.dart';
import 'package:finance_house/features/manage_beneficiary/domain/repositories/add_benef_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddBeneficiaryRepository)
class AddBeneficiaryRepositoryImp implements AddBeneficiaryRepository {
  final AddBeneficiaryDataSource remoteDataSource;

  AddBeneficiaryRepositoryImp({required this.remoteDataSource});

  @override
  Future<EitherResponse<UserSummary>> getUserInfo(String phNo) {
    return remoteDataSource.getUserInfo(phNo);
  }

  @override
  Future<EitherResponse<Beneficiary>> addBeneficiary(
      AddBeneficiaryRequest request) {
    return remoteDataSource.addBeneficiary(request);
  }
}
