
abstract class FieldValidator {
  String? validate(String value);
}

class RequiredFieldValidator implements FieldValidator {
  final String fieldName;

  RequiredFieldValidator(this.fieldName);

  @override
  String? validate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "$fieldName is required";
    }
    return null;
  }
}
class PhoneNumberValidator implements FieldValidator {
  final String fieldName;

  PhoneNumberValidator(this.fieldName);

  @override
  String? validate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "$fieldName is required";
    }

    if (!RegExp(r'^\d{9}$').hasMatch(value.trim())) {
      return "$fieldName must contain exactly 9 digits";
    }

    return null;
  }
}
class AmountValidator implements FieldValidator {
  final String fieldName;
  final bool isVerified;

  AmountValidator(this.fieldName, this.isVerified);

  @override
  String? validate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "$fieldName is required";
    }

    final amt = double.tryParse(value);
    if (amt == null) {
      return "$fieldName must be a number";
    }

    final max = isVerified ? 1000 : 500;
    if (amt > max) {
      return "$fieldName cannot exceed AED ${max.toStringAsFixed(0)}";
    }

    return null;
  }
}
