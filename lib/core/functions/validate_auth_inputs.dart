import 'package:get/get.dart';

enum AuthInputType { username, email, phone, password }

validateAuthInputs(String val, int max, int min, AuthInputType type) {
  if (val.isEmpty) {
    return "required field";
  }
  switch (type) {
    case AuthInputType.username:
      if (!GetUtils.isUsername(val)) return "Invalid username";
      break;
    case AuthInputType.email:
      if (!GetUtils.isEmail(val)) return "Invalid email";
      break;

    case AuthInputType.phone:
      if (!GetUtils.isPhoneNumber(val)) return "Invalid phone number";
      break;
    case AuthInputType.password:
      if (!val.contains(RegExp(r'[A-Z]')) ||
          !val.contains(RegExp(r'[a-z]')) ||
          !val.contains(RegExp(r'[0-9]'))) {
        return "Password must contain at least one uppercase letter one lowercase letter and one number";
      }
      break;
  }
  if (val.length < min) {
    return " minimum length is $min";
  }
  if (val.length > max) {
    return " maximum length is $max";
  }

  return null;
}

//Refactored and Shortened function 
//
// String? validateAuthInputs(String val, int max, int min, AuthInputType type) {
//   if (val.isEmpty) return "required field";
//   final Map<AuthInputType, bool Function(String)> validators = {
//     AuthInputType.username: GetUtils.isUsername,
//     AuthInputType.email: GetUtils.isEmail,
//     AuthInputType.phone: GetUtils.isPhoneNumber,
//     AuthInputType.password: (v) => RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d).+$').hasMatch(v),
//   };
  
//   if (!validators[type]!(val)) {
//     return "Invalid ${type.name}";
//   } else if (val.length < min) {
//     return "Minimum length is $min";
//   } else if (val.length > max) {
//     return "Maximum length is $max";
//   }
//   return null; // Indicates validation passed
// }