import 'package:finance_house/features/home/data/datasources/remote_datasource/home_remote_data_source.dart';
import 'package:finance_house/features/home/data/models/user_model.dart';
import 'package:finance_house/features/home/domain/dto/remove_benef_request.dart';
import 'package:finance_house/features/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:finance_house/core/types/typedefs.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImp extends HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImp({required this.remoteDataSource});

  @override
  Future<EitherResponse<User>> getUserDetails(String phNo) async {
    return await remoteDataSource.getUserDetails(phNo);
  }

  @override
  Future<EitherResponse<void>> deleteBeneficiary(
      RemoveBeneficiaryRequest request) async {
    return await remoteDataSource.deleteBeneficiary(request);
  }
}
