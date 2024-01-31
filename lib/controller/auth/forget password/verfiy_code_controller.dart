import 'package:ecommercecourse/core/constants/routes_name.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  verifyCode();
  goToResetPassword();
}

class VerifyCodeControllerImpl extends VerifyCodeController {
  late String? verifiedCode;

  @override
  verifyCode() {}

  @override
  goToResetPassword() {
    Get.toNamed(AppRoutes.resetPassword);
  }
}
