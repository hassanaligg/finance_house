import 'package:injectable/injectable.dart';
import 'package:finance_house/core/data/failure/error_messages/local_errors.dart';
import 'package:finance_house/core/data/failure/error_messages/server_error.dart';
import 'package:finance_house/core/data/failure/http/http_failure.dart';
import 'package:finance_house/core/data/failure/local_storage/local_storage_failure.dart';
import 'package:finance_house/core/data/failure/parser/failure_parser.dart';


@module
abstract class FailureParserModule {
  @lazySingleton
  FailureParser provideFailureParser() {
    return FailureParser({
      NoInternetFailure: NoInternetFailureParser(),
      UnauthorizedFailure: UnauthorizedFailureParser(),
      ServerFailure: ServerFailureParser(),
      TimeOutFailure: TimeOutFailureParser(),
      CustomFailure: CustomFailureParser(),
      DataNotExistFailure: DataNotExistFailureParser(),
      BadDataFailure: BadDataFailureParser(),
      OperationFailure: OperationFailed(),
    });
  }
}

