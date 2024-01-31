import 'package:ecommercecourse/core/constants/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CheckEmailController extends GetxController {
  checkEmail();
  goToVerifySignUpCode();
}

class CheckEmailControllerImpl extends CheckEmailController {
  late TextEditingController emailController;

  @override // Add your method for checking email here
  void checkEmail() {
    // Implement email checking logic
  }
  @override
  goToVerifySignUpCode() {
    Get.toNamed(AppRoutes.verifySignUpCode);
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
