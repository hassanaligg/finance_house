
import 'package:finance_house/core/data/failure/base/base_failure.dart';

abstract class LocalStorageFailure extends Failure {
  LocalStorageFailure();
}

class DataNotExistFailure extends LocalStorageFailure {
  DataNotExistFailure();
}

class BadDataFailure extends LocalStorageFailure {
  BadDataFailure();
}

class OperationFailure extends LocalStorageFailure {
  final String message;

  OperationFailure({required this.message});
}
