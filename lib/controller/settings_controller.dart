import 'package:zingoshop/core/constants/routes_name.dart';
import 'package:zingoshop/core/services/services.dart';
import 'package:get/get.dart';

abstract class SettingsController extends GetxController {
  logout();
  goToAddress();
  goToOrders();
  goToArchive();
}

class SettingsControllerImpl extends SettingsController {
  late final AppServices _appServices;
  bool isNotificationEnabled = false;
  late String username;
  late String email;
  enableNotification(bool val) {
    //unsubscribe to notifications
    //or
    //subscribe to notifications
    isNotificationEnabled = val;
    update();
  }

  @override
  logout() {
    _appServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoutes.language);
  }

  @override
  goToAddress() {
    Get.toNamed(AppRoutes.address);
  }

  @override
  goToOrders() {
    Get.toNamed(AppRoutes.pendingOrders);
  }

  @override
  goToArchive() {
    Get.toNamed(AppRoutes.archiveOrders);
  }

  @override
  void onInit() {
    _appServices = Get.find();
    username = _appServices.sharedPreferences.getString("username")!;
    email = _appServices.sharedPreferences.getString("email")!;
    super.onInit();
  }
}
