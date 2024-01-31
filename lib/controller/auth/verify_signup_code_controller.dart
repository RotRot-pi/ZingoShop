import 'package:ecommercecourse/core/constants/routes_name.dart';
import 'package:get/get.dart';

abstract class VerifySignUpCodeController extends GetxController {
  verfiyCode();
  goToSuccessSignUp();
}

class VerifySignUpCodeControllerImpl extends VerifySignUpCodeController {
  @override
  goToSuccessSignUp() {
    Get.toNamed(AppRoutes.successSignUp);
  }

  @override
  verfiyCode() {}
}
