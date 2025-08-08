
import 'package:finance_house/core/data/failure/base/base_failure.dart';
import 'package:finance_house/core/data/failure/http/http_failure.dart';
import 'package:finance_house/core/data/failure/parser/failure_message_strategy.dart';

class NoInternetFailureParser implements FailureMessageStrategy {
  @override
  String parse(Failure failure) {
    return "failures.no_internet";
  }
}

class UnauthorizedFailureParser implements FailureMessageStrategy {
  @override
  String parse(Failure failure) {
    return "failures.not_verified";
  }
}

class ServerFailureParser implements FailureMessageStrategy {
  @override
  String parse(Failure failure) {
    return "failures.server_error";
  }
}

class TimeOutFailureParser implements FailureMessageStrategy {
  @override
  String parse(Failure failure) {
    return "failures.time_out";
  }
}

class CustomFailureParser implements FailureMessageStrategy {
  @override
  String parse(Failure failure) {
    return (failure as CustomFailure).message;
  }
}

class DefaultFailureParser implements FailureMessageStrategy {
  @override
  String parse(Failure failure) {
    return "failures.some_thing_wrong";
  }
}


