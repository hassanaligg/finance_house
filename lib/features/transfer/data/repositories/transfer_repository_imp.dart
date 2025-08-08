import 'package:finance_house/core/types/typedefs.dart';
import 'package:finance_house/features/transfer/data/datasource/remote_datasource/transfer_data_source.dart';
import 'package:finance_house/features/transfer/domain/dto/send_money_request.dart';
import 'package:finance_house/features/transfer/domain/repositories/transfer_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: TransferRepository)
class TransferRepositoryImp implements TransferRepository {
  final TransferDataSource remoteDataSource;

  TransferRepositoryImp({required this.remoteDataSource});

  @override
  Future<EitherResponse<void>> transferMoney(SendMoneyRequest request) {
    return remoteDataSource.transferMoney(request);
  }
}
