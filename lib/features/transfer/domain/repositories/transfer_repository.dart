import 'package:finance_house/core/types/typedefs.dart';
import 'package:finance_house/features/transfer/domain/dto/send_money_request.dart';

abstract class TransferRepository{
   Future<EitherResponse<void>> transferMoney(SendMoneyRequest request);
}