import 'package:ecommercecourse/core/classes/request_status.dart';
import 'package:ecommercecourse/core/constants/routes_name.dart';
import 'package:ecommercecourse/core/functions/handing_data.dart';
import 'package:ecommercecourse/data/datasource/remote/forget_password/check_email.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CheckEmailController extends GetxController {
  checkEmail();
  goToVerifySignUpCode();
}

class CheckEmailControllerImpl extends CheckEmailController {
  CheckEmailData checkEmailData = CheckEmailData(crud: Get.find());

  late TextEditingController emailController;
  RequestStatus requestStatus = RequestStatus.notInitialized;
  @override // Add your method for checking email here
  void checkEmail() async {
    requestStatus = RequestStatus.loading;
    update();
    var response = await checkEmailData.postData(
      emailController.text,
    );
    
    requestStatus = handelingData(response);
    
    if (requestStatus == RequestStatus.success &&
        response['status'] == 'success') {
      goToVerifySignUpCode();
    } else {
      Get.defaultDialog(
        title: "warning".tr,
        middleText: "email_not_exist".tr,
      );
      requestStatus;
    }
    update();
  }

  @override
  goToVerifySignUpCode() {
    Get.toNamed(AppRoutes.verifyCode,
        arguments: {'email': emailController.text});
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
