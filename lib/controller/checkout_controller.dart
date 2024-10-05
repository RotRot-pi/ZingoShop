import 'package:zingoshop/core/functions/handing_data.dart';
import 'package:zingoshop/core/services/services.dart';
import 'package:zingoshop/core/services/stripe_services.dart';
import 'package:zingoshop/data/datasource/remote/checkout.dart';
import 'package:zingoshop/data/model/address.dart';

import 'package:get/get.dart';

import '../core/classes/request_status.dart';
import '../core/constants/routes_name.dart';
import '../data/datasource/remote/address/address_data.dart';

class CheckoutController extends GetxController {
  AddressData addressData = Get.put(AddressData(Get.find()));
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));
  AppServices myServices = Get.find();

  RequestStatus statusRequest = RequestStatus.notInitialized;

  int? couponId;
  int? couponDiscount = 0;
  dynamic ordersPrice;
  int? paymentMethod;
  int? deliveryType;
  int? addressid;

  List<Address> dataaddress = [];

  choosePaymentMethod(int val) {
    paymentMethod = val;
    update();
  }

  chooseDeliveryType(int val) {
    deliveryType = val;
    update();
  }

  chooseShippingAddress(int val) {
    addressid = val;
    update();
  }

  getShippingAddress() async {
    statusRequest = RequestStatus.loading;

    var response = await addressData
        .getAddress(myServices.sharedPreferences.getInt("id")!);

    if (response['status'] == "success") {
      List listdata = response['data'];
      dataaddress.addAll(listdata.map((e) => Address.fromJson(e)));
    }
    statusRequest = RequestStatus.success;
    update();
  }

  goToAddress() {
    Get.toNamed(AppRoutes.addAddress);
  }

  checkout() async {
    if (paymentMethod == null) {
      return Get.snackbar(
        "Error",
        "Please choose payment method",
      );
    }
    if (deliveryType == null) {
      return Get.snackbar(
        "Error",
        "Please choose delivery type",
      );
    }
    if (deliveryType == 0 && addressid == null) {
      return Get.snackbar(
        "Error",
        "Please choose shipping address",
      );
    }
    if (dataaddress.isEmpty) {
      return Get.snackbar(
        "Error",
        "Please add shipping address",
      );
    }
    addressid == null ? addressid = 0 : addressid = addressid;
    couponId == null ? couponId = 0 : couponId = couponId;

    var map = {
      "user_id": myServices.sharedPreferences.getInt("id")!.toString(),
      "address_id": addressid!.toString(),
      "order_type": deliveryType!.toString(),
      "coupon_id": couponId!.toString(),
      "delivery_price": "10",
      "order_price": ordersPrice.toString(),
      "coupon_discount": couponDiscount!.toString(),
      "payment_type": paymentMethod!.toString(),
    };
    if (paymentMethod == 0) {
      var response = await checkoutData.checkout(map);
      statusRequest = handelingData(response);

      if (RequestStatus.success == statusRequest) {
        Get.offAllNamed(AppRoutes.home);
      } else {
        Get.snackbar(
          "Error",
          "Something went wrong",
        );
      }
    } else if (paymentMethod == 1) {
      var response = await checkoutData.checkout(map);
      print("Response: $response");
      var clientSecret = response['client_secret'];

      if (clientSecret != null) {
        var result = await StripeServices.instance.payWithStripe(clientSecret);

        if (result == true) {
          Get.offAllNamed(AppRoutes.home);
        } else {
          Get.snackbar(
            "Error",
            "Payment failed",
          );
        }
      } else {
        Get.snackbar(
          "Error",
          "Client secret is null",
        );
      }
    }

    update();
  }

  @override
  void onInit() {
    getShippingAddress();
    couponId = Get.arguments['couponId'] ?? 0;
    ordersPrice = Get.arguments['ordersPrice'];
    couponDiscount = Get.arguments['couponDiscount'];

    super.onInit();
  }
}
