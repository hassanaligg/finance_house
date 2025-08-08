import 'package:finance_house/core/data/constants/url_constants.dart';
import 'package:finance_house/core/data/datasource/base_remote_datasource.dart';
import 'package:finance_house/core/types/typedefs.dart';
import 'package:finance_house/features/home/data/models/user_model.dart';
import 'package:finance_house/features/manage_beneficiary/data/datasource/remote_datasource/add_benf_data_source.dart';
import 'package:finance_house/features/manage_beneficiary/data/models/user_summary.dart';
import 'package:finance_house/features/manage_beneficiary/domain/dto/add_benef_request.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddBeneficiaryDataSource)
class AddBeneficiaryDataSourceImp extends BaseRemoteDataSourceImpl
    implements AddBeneficiaryDataSource {
  String userInfo = '${UrlConstants.baseUrl}/Users/search';
  String addNewBeneficiary = '${UrlConstants.baseUrl}/Users/add-beneficiary';

  AddBeneficiaryDataSourceImp(
      {required super.dio, required super.failureParser});

  @override
  Future<EitherResponse<UserSummary>> getUserInfo(String phNo) async {
    return await get<UserSummary>(
      url: userInfo,
      params: {"phone": phNo},
      decoder: (json) {
        return UserSummary.fromJson(json);
      },
      requiredToken: false,
    );
  }

  @override
  Future<EitherResponse<Beneficiary>> addBeneficiary(
      AddBeneficiaryRequest request) async {
    return await post<Beneficiary>(
      url: addNewBeneficiary,
      body: request.toJson(),
      decoder: (json) {
        return Beneficiary.fromJson(json);
      },
      requiredToken: false,
    );
  }
}
