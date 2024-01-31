import 'package:ecommercecourse/core/constants/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();
  goToSuccessPasswordReset();
}

class ResetPasswordControllerImpl extends ResetPasswordController {
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  resetPassword() {
    if (formKey.currentState!.validate()) {
      print("=========ResetPassword is valid=========");
    } else {
      print("=========ResetPassword is not valid=========");
    }
  }

  @override
  goToSuccessPasswordReset() {
    Get.toNamed(AppRoutes.successPasswordReset);
  }

  @override
  void onInit() {
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
