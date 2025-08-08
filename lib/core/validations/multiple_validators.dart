
import 'package:finance_house/core/validations/field_validators.dart';

class Validator implements FieldValidator{
  final List<FieldValidator> validators;

  Validator(this.validators);

  @override
  String? validate(String value) {
    for (final validator in validators) {
      final error = validator.validate(value);
      if (error != null) {
        return error;
      }
    }
    return null;
  }
}

/*
final emailValidator = Validator([
  RequiredValidator(),
  AmountValidator(),
]);*/
