
import 'package:finance_house/core/data/failure/base/base_failure.dart';
import 'package:finance_house/core/data/failure/local_storage/local_storage_failure.dart';
import 'package:finance_house/core/data/failure/parser/failure_message_strategy.dart';

class DataNotExistFailureParser implements FailureMessageStrategy {
  @override
  String parse(Failure failure) {
    return "Data does not exist in local storage.";
  }
}

class BadDataFailureParser implements FailureMessageStrategy {
  @override
  String parse(Failure failure) {
    return "Bad data in local storage.";
  }
}

class OperationFailed implements FailureMessageStrategy {
  @override
  String parse(Failure failure) {
    return (failure as OperationFailure).message;
  }
}