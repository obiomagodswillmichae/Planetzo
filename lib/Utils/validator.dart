import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

extension ValidatorExt on String {
  bool get isValidName => RegExp(r'^[a-zA-Z]+(?: [a-zA-Z]+)*$').hasMatch(this);

  bool get isValidUserID => isPhoneNumber || (length >= 10 && isNumericOnly);
  bool get isValidUserCVV => isNumericOnly && length == 3;
  bool get isValidUserCardNumber => length >= 10;

  // bool get isValidCert => length == 11 && isNumericOnly;

  bool get isValidAccountNumber => length >= 10 && isNumericOnly;
}

class Validator {
  static String? validateName(String? value) {
    return value != null && value.trim().isValidName
        ? null
        : 'Not a valid Name';
  }

  static String? validateCVV(String? value) {
    return value != null && value.trim().isValidUserCVV
        ? null
        : 'Not a valid cvv';
  }

  static String? validateCardNumber(String? value) {
    return value != null && value.trim().isValidUserCardNumber
        ? null
        : 'Not a valid card number';
  }

  static String? validateUserName(String? value) {
    return value != null && value.trim().isAlphabetOnly
        ? null
        : 'Not a valid User Name';
  }

  static String? validateUserID(String? value) {
    return value != null && value.isValidUserID
        ? null
        : 'Not a valid phone number';
  }

  static String? validateAddress(String? value) {
    return value != null && value.length > 10 ? null : 'Be more descriptive';
  }

  static String? validatePhoneNumber(String? value) {
    return value != null && value.trim().isPhoneNumber
        ? null
        : 'Not a valid phone number';
  }

  static String? validatePassword(String? value) {
    return value != null && value.length >= 8
        ? null
        : 'Password must have 8 or more characters';
  }

  static String? validateEmail(String? value) {
    return value != null && value.trim().isEmail ? null : 'Not a valid email';
  }

  static String? validateFieldNotEmpty(String? value, {String? field}) {
    return value != null && value.isNotEmpty
        ? null
        : '${field ?? "Field"} is required';
  }
}
