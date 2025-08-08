import 'package:finance_house/core/types/typedefs.dart';
import 'package:finance_house/features/transfer/domain/dto/send_money_request.dart';

abstract class TransferDataSource {
  Future<EitherResponse<void>> transferMoney(SendMoneyRequest request);
}
