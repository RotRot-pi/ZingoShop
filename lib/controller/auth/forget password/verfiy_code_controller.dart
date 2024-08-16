import 'package:zingoshop/core/classes/request_status.dart';
import 'package:zingoshop/core/constants/routes_name.dart';
import 'package:zingoshop/core/functions/handing_data.dart';
import 'package:zingoshop/data/datasource/remote/forget_password/verify_code_data.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  verifyCode(String verifyCode);
  goToResetPassword();
}

class VerifyCodeControllerImpl extends VerifyCodeController {
  VerifyCodeData verifyCodeData = VerifyCodeData(crud: Get.find());
  RequestStatus requestStatus = RequestStatus.notInitialized;
  late String email;
  @override
  verifyCode(String verifyCode) async {
    requestStatus = RequestStatus.loading;
    update();
    var response = await verifyCodeData.postData(email, verifyCode);
    requestStatus = handelingData(response);
    if (requestStatus == RequestStatus.success &&
        response['status'] == 'success') {
      goToResetPassword();
    } else {
      Get.defaultDialog(
        title: "warning".tr,
        middleText: "verification_code_not_correct".tr,
      );
    }
    update();
  }

  @override
  goToResetPassword() {
    Get.toNamed(AppRoutes.resetPassword, arguments: {'email': email});
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
