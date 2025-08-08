import 'package:finance_house/core/data/constants/url_constants.dart';
import 'package:finance_house/core/data/datasource/base_remote_datasource.dart';
import 'package:finance_house/core/types/typedefs.dart';
import 'package:finance_house/features/transfer/data/datasource/remote_datasource/transfer_data_source.dart';
import 'package:finance_house/features/transfer/domain/dto/send_money_request.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: TransferDataSource)
class TransferDataSourceImp extends BaseRemoteDataSourceImpl
    implements TransferDataSource {
  String topUp = '${UrlConstants.baseUrl}/Users/topup';

  TransferDataSourceImp({required super.dio, required super.failureParser});

  @override
  Future<EitherResponse<void>> transferMoney(SendMoneyRequest request) async {
    return await post(
      url: topUp,
      body: request.toJson(),
      decoder: (json) {
        return;
      },
      requiredToken: false,
    );
  }
}
