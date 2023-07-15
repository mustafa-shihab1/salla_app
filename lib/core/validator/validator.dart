import 'package:get/get_utils/src/get_utils/get_utils.dart';
import '../resources/manager_strings.dart';

class FieldValidator {
  String? validateEmail(String? email) {
    if (email!.isEmpty) {
      return ManagerStrings.invalidEmail;
    }

    if (!RegExp(r"\S+@\S+\.\S+").hasMatch(email)) {
      return ManagerStrings.invalidEmail;
    }

    if (!GetUtils.isEmail(email)) {
      return ManagerStrings.invalidEmail;
    }

    return null;
  }

  String? validatePassword(String? password) {
    if (password!.isEmpty) {
      return ManagerStrings.invalidPassword;
    }

    if (password.length < 8) {
      return ManagerStrings.invalidPassword;
    }

    return null;
  }

  String? validateFullName(String? fullName) {
    if (fullName!.isEmpty) {
      return ManagerStrings.requiredFullName;
    }

    return null;
  }

  String? validatePhone(String? phone) {
    if (phone!.isEmpty) {
      return ManagerStrings.requiredPhone;
    }

    if (!GetUtils.isPhoneNumber(phone)) {
      return ManagerStrings.invalidEmail;
    }

    return null;
  }
}
