import 'package:zingoshop/core/classes/request_status.dart';
import 'package:zingoshop/core/functions/handing_data.dart';
import 'package:zingoshop/core/services/services.dart';
import 'package:zingoshop/data/datasource/remote/notification_data.dart';
import 'package:zingoshop/data/model/notification.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  NotificationData notificationData = NotificationData(crud: Get.find());
  final AppServices _appServices = Get.find();
  List data = [];
  late RequestStatus requestStatus;
  getData() async {
    requestStatus = RequestStatus.loading;
    update();

    var response = await notificationData
        .getData(_appServices.sharedPreferences.getInt('id'));
    requestStatus = handelingData(response);

    if (requestStatus == RequestStatus.success &&
        response['status'] == 'success') {
      for (var i = 0; i < response['data'].length; i++) {
        data.add(Notifications.fromMap(response['data'][i]));
      }
    } else {
      requestStatus;
    }
    update();
  }

  // isEnlish() {
  //   bool isEn =
  //       _appServices.sharedPreferences.getString('lang') == 'en' ? true : false;
  //   return isEn;
  // }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
