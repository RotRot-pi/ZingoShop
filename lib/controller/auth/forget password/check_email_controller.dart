import 'package:zingoshop/core/classes/request_status.dart';
import 'package:zingoshop/core/constants/routes_name.dart';
import 'package:zingoshop/core/functions/handing_data.dart';
import 'package:zingoshop/data/datasource/remote/forget_password/check_email.dart';
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
    try {
      if (requestStatus == RequestStatus.success) {
        if (response['status'] == 'success') {
          goToVerifySignUpCode();
        } else {
          Get.defaultDialog(
            title: "warning".tr,
            middleText: "email_not_exist".tr,
          );
          requestStatus;
        }
      }
    } catch (e) {
      throw Exception(e);
    }

    update();
  }

  @override
  goToVerifySignUpCode() {
    Get.offNamed(AppRoutes.verifyCode,
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
