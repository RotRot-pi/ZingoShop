import 'package:zingoshop/core/classes/request_status.dart';
import 'package:zingoshop/core/constants/routes_name.dart';
import 'package:zingoshop/core/functions/handing_data.dart';
import 'package:zingoshop/data/datasource/remote/auth/signup_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goTologin();
  goVerifySignUpCode();
  showPassword();
}

class SignUpControllerImpl extends SignUpController {
  SignUpData singupData = SignUpData(crud: Get.find());
  RequestStatus requestStatus = RequestStatus.notInitialized;
  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  final formKey = GlobalKey<FormState>();
  bool val = true;
  List signupData = [];

  @override
  signUp() async {
    if (formKey.currentState!.validate()) {
      requestStatus = RequestStatus.loading;
      update();
      var response = await singupData.postData(
        usernameController.text,
        emailController.text,
        passwordController.text,
        phoneController.text,
      );
      requestStatus = handelingData(response);

      if (requestStatus == RequestStatus.success &&
          response['status'] == 'success') {
        goVerifySignUpCode();
        //signupData.addAll(response['data']);
      } else {
        Get.defaultDialog(
          title: "warning".tr,
          middleText: "user_already_exist".tr,
        );
        requestStatus;
      }
      update();
    } else {}
  }

  @override
  goVerifySignUpCode() {
    Get.offNamed(AppRoutes.verifySignUpCode,
        arguments: {'email': emailController.text});
  }

  @override
  goTologin() {
    Get.offNamed(AppRoutes.login);
  }

  @override
  void onInit() {
    usernameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  showPassword() {
    val == false ? val = true : val = false;
    update();
  }
}
