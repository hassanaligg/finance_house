

import 'package:finance_house/core/data/failure/base/base_failure.dart';

abstract class FailureMessageStrategy {
  String parse(Failure failure);
}