import 'package:flutter/material.dart';
import 'package:init_structure/utils/constants/constants_strings.dart';

final notName = RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]');
final alpha = RegExp(r"^[A-Za-z ]+$");
final numeric = RegExp(r"^[0-9 ]+$");
final alphanumeric = RegExp(r'^[a-zA-Z0-9]+$');
final alphanumericAddress = RegExp(r'^(?!\s*$)[a-zA-Z0-9- ]+$');

class ValidationUtils {
  // Validation of Email Field
  String? validateEmail(String value) {
    RegExp? regex = RegExp(
        "r'^(([^<>()[]\\.,;:s@\"]+(.[^<>()[]\\.,;:s@\"]+)*)|(\".+\"))@(([[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}])|(([a-zA-Z-0-9]+.)+[a-zA-Z]{2,}))\$");
    // "r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))\$");
    if (value.trim().isEmpty) {
      return ConstantStrings.emailRequired;
    } else if (!regex.hasMatch(value.trim())) {
      return "This Email Address is not valid";
    }
    return null;
  }

//Validation of Password
  String? validatePassword(String value) {
    if (value.trim().isEmpty) {
      return "Password is Required";
    } else if (value.trim().length < 6) {
      return 'Password should be more than 6.';
    }
    return null;
  }

  String? validateCheckNumber(String value) {
    if (value.trim().isEmpty) {
      return "Check Number is Required";
    }
    return null;
  }

  // Validation of Password Matching
  String? validatePasswordMatching(
      GlobalKey<FormFieldState> key, String value) {
    var password = key.currentState?.value;

    if (value.isEmpty) {
      return "Password is Required";
    } else if (value != password) {
      return 'Password is not matching';
    }
    return null;
  }

  // Validation of Email Field
  String? validateMobile(String value) {
    if (value.trim().isEmpty) {
      return "Mobile Number is Required";
    } else if (value.trim().length < 6 && value.trim().length < 10) {
      return "Enter Valid Mobile Number.";
    }
    return null;
  }

  // Validation of empty Field
  String? validateValue(String value, String errorMessage) {
    if (value.trim().isEmpty) {
      return errorMessage;
    }
    return null;
  }

  String? validateAmount(String value, double maxAmount) {
    if (value.trim().isEmpty) {
      return "amount should not be blank";
    } else if (double.parse(value) > maxAmount) {
      return "amount should not be more than invoice";
    }
    return null;
  }

  static bool validateName(String name) {
    Pattern pattern = r'^[a-zA-Z][a-zA-Z\- ]*[a-zA-Z ]$';
    RegExp regex = RegExp(pattern.toString());
    return regex.hasMatch(name);
  }
}
