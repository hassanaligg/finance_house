
import 'package:finance_house/core/data/failure/base/base_failure.dart';
import 'package:finance_house/core/data/failure/error_messages/server_error.dart';
import 'package:finance_house/core/data/failure/parser/failure_message_strategy.dart';


class FailureParser {
  final Map<Type, FailureMessageStrategy> _strategies;

  FailureParser(this._strategies);

  String mapFailureToString(Failure failure) {
    final strategy = _strategies[failure.runtimeType] ?? DefaultFailureParser();
    return strategy.parse(failure);
  }
}
