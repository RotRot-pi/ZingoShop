import 'dart:developer';

import 'package:ecommercecourse/core/classes/request_status.dart';
import 'package:ecommercecourse/core/constants/routes_name.dart';
import 'package:ecommercecourse/core/functions/handing_data.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/remote/cart_item_data.dart';
import 'package:ecommercecourse/data/model/cart.dart';
import 'package:ecommercecourse/data/model/coupon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  late final TextEditingController couponController;
  CartData cartData = CartData(Get.find());

  late RequestStatus requestStatus;

  final AppServices _appServices = Get.find();
  Coupon? coupon;
  List data = [];

  double ordersPrice = 0.0;
  var totalOrdersPrice;
  //var totalPrice;
  int totalcountitems = 0;

  var discountCoupon = 0;
  var couponName;
  var couponId;

  //TODO: add a proper adding and deleting from cart methods to better handle the UI

  add(var itemsid) async {
    // requestStatus = RequestStatus.loading;
    // update();
    var response = await cartData.addCart(
        _appServices.sharedPreferences.getInt("id")!, itemsid, 1);

    requestStatus = (handelingData(response));
    if (RequestStatus.success == requestStatus) {
      // Start backend
      if (response['status'] == "success") {
        refreshPage();
        // Get.rawSnackbar(
        //     title: "اشعار",
        //     messageText: const Text("تم اضافة المنتج الى السلة "));
      } else {
        requestStatus = (RequestStatus.failure);
      }
      // End
    }
    update();
  }

  delete(var itemsid) async {
    // requestStatus = (RequestStatus.loading);
    // update();

    var response = await cartData.deleteCart(
        _appServices.sharedPreferences.getInt("id")!, itemsid, 1);

    requestStatus = handelingData(response);
    if (RequestStatus.success == requestStatus) {
      // Start backend
      if (response['status'] == "success") {
        refreshPage();
        // Get.rawSnackbar(
        //     title: "اشعار",
        //     messageText: const Text("تم ازالة المنتج من السلة "));

        // data.addAll(response['data']);
      } else {
        // requestStatus = RequestStatus.failure as <RequestStatus>;
        return Get.snackbar("Error", "Can't Delete");
      }

      // End
    }
    update();
  }

  resetVarCart() {
    totalcountitems = 0;
    ordersPrice = 0.0;
    data.clear();
  }

  refreshPage() {
    resetVarCart();
    view();
  }

  view() async {
    if (requestStatus != RequestStatus.success) {
      requestStatus = RequestStatus.loading;
      update();
    }

    var response =
        await cartData.viewCart(_appServices.sharedPreferences.getInt("id"));

    requestStatus = handelingData(response);
    if (requestStatus == RequestStatus.success) {
      // Start backend

      if (response['status'] == "success") {
        List datacart = response['datacart'];
        if (datacart.isEmpty) {
          requestStatus = RequestStatus.failure;
          update();
        } else {
          try {
            for (var item in datacart) {
              data.add(CartModel.fromMap(item));
              totalcountitems += item['cart_item_count'] as int;
            }
            ordersPrice = response['countprice']['cart_total_price'];
            log("PRICE ORDERS :$ordersPrice");
          } catch (e) {
            throw Exception(e);
          }
        }
      }
    } else {
      requestStatus = RequestStatus.failure;
    }

    update();
  }

  checkCoupon() async {
    discountCoupon = 0;
    var response = await cartData.checkCoupon(couponController.text);
    if (response['status'] == "success") {
      coupon = Coupon.fromJson(response['data']);
      discountCoupon = coupon!.couponDiscount!;
      couponName = coupon?.couponName;
      couponId = coupon?.couponId;
      ordersPrice = ordersPrice - (ordersPrice * discountCoupon / 100);
    } else {
      Get.snackbar(
        "Error",
        "The coupon is invalid,Please try again",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
    }
    update();
  }

  getTotalPrice() {
    ordersPrice = ordersPrice - -(ordersPrice * discountCoupon);

    return ordersPrice.toStringAsFixed(2);
  }

  goToCheckout() {
    if (data.isEmpty) {
      return Get.snackbar("Error:", "The cart is empty, Please add items");
    }

    Get.toNamed(AppRoutes.checkout, arguments: {
      "couponId": couponId,
      "ordersPrice": ordersPrice,
      "couponDiscount": discountCoupon
    });
  }

  @override
  void onInit() {
    couponController = TextEditingController();
    requestStatus = RequestStatus.notInitialized;
    view();
    super.onInit();
  }
}
