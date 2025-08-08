import 'package:finance_house/features/home/data/datasources/remote_datasource/home_remote_data_source.dart';
import 'package:finance_house/features/home/data/models/user_model.dart';
import 'package:finance_house/features/home/domain/dto/remove_benef_request.dart';
import 'package:injectable/injectable.dart';
import 'package:finance_house/core/data/constants/url_constants.dart';
import 'package:finance_house/core/data/datasource/base_remote_datasource.dart';
import 'package:finance_house/core/types/typedefs.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImp extends BaseRemoteDataSourceImpl
    implements HomeRemoteDataSource {
  String userDetails = '${UrlConstants.baseUrl}/Users/by-phone';
  String deleteUserBeneficiary =
      '${UrlConstants.baseUrl}/Users/delete-beneficiary';

  HomeRemoteDataSourceImp({required super.dio, required super.failureParser});

  @override
  Future<EitherResponse<User>> getUserDetails(String phNo) async {
    return await get<User>(
      url: userDetails,
      params: {"phone": phNo},
      decoder: (json) {
        return User.fromJson(json);
      },
      requiredToken: false,
    );
  }

  @override
  Future<EitherResponse<void>> deleteBeneficiary(
      RemoveBeneficiaryRequest request) async {
    return await post(
      url: deleteUserBeneficiary,
      body: request.toJson(),
      decoder: (json) {
        return;
      },
      requiredToken: false,
    );
  }
}
