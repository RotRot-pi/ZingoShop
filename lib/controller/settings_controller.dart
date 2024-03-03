import 'package:ecommercecourse/core/constants/routes_name.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:get/get.dart';

abstract class SettingsController extends GetxController {
  logout();
  goToAddress();
}

class SettingsControllerImpl extends SettingsController {
  final AppServices _appServices = Get.find();

  @override
  logout() {
    _appServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoutes.language);
  }

  @override
  goToAddress() {
    Get.toNamed(AppRoutes.address);
  }
}
