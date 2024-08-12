import 'package:ecommercecourse/core/classes/request_status.dart';
import 'package:ecommercecourse/core/constants/routes_name.dart';
import 'package:ecommercecourse/core/functions/handing_data.dart';
import 'package:ecommercecourse/data/datasource/remote/order/pending.dart';
import 'package:ecommercecourse/data/model/order_details.dart';
import 'package:get/get.dart';

import '../../core/services/services.dart';

class PendingOrderController extends GetxController {
  PendingOrderData pendingOrderData = PendingOrderData(crud: Get.find());
  final AppServices _appServices = Get.find();
  List data = [];
  late RequestStatus requestStatus;
  getPendingData() async {
    requestStatus = RequestStatus.loading;
    update();

    var response = await pendingOrderData
        .getData(_appServices.sharedPreferences.getInt('id')!.toString());
    requestStatus = handelingData(response);

    if (requestStatus == RequestStatus.success &&
        response['status'] == 'success') {
      for (var item in response['data']) {
        data.add(OrderDetails.fromJson(item));
      }
    } else {
      requestStatus;
    }
    update();
  }

  deleteOrderDialog(var orderId) {
    Get.defaultDialog(
      title: "Delete Order",
      middleText: "are_you_sure_you_want_to_delete_this_order".tr,
      textConfirm: "Yes",
      textCancel: "No",
      onConfirm: () async {
        await deleteOrder(orderId);
        Get.back();
      },
      onCancel: () => Get.back(),
    );
  }

  deleteOrder(var orderId) async {
    try {
      var response = await pendingOrderData.deleteData(orderId.toString());
      if (response['status'] == 'success') {
        data.clear();
        getPendingData();
        Get.snackbar("Success", "order deleted");
        update();
      } else {
        Get.snackbar("Error", "order not deleted");
        update();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  goToOrderTracking(OrderDetails order) {
    Get.toNamed(AppRoutes.orderTracking, arguments: {"order": order});
  }

  printOrderType(var orderType) {
    if (orderType == 0) {
      return 'Delivery';
    } else {
      return 'Receive';
    }
  }

  printPaymentMethod(var paymentType) {
    if (paymentType == 0) {
      return 'Cash';
    } else if (paymentType == 1) {
      return 'Card';
    }
  }

  printOrderStatus(var orderStatus) {
    if (orderStatus == 0) {
      return 'Pending';
    } else if (orderStatus == 1) {
      return 'Accepted';
    } else if (orderStatus == 2) {
      return 'Rejected';
    } else if (orderStatus == 3) {
      return 'Delivered';
    } else {
      return "Archived";
    }
  }

  onNotificationRefresh() {
    getPendingData();
  }

  @override
  void onInit() {
    getPendingData();
    super.onInit();
  }
}
