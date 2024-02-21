import 'package:ecommercecourse/core/classes/request_status.dart';
import 'package:ecommercecourse/core/functions/handing_data.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/remote/cart_item_data.dart';
import 'package:ecommercecourse/data/model/cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  CartData cartData = CartData(Get.find());

  Rx<RequestStatus> requestStatus = RequestStatus.notInitialized.obs;

  final AppServices _appServices = Get.find();

  var data = [].obs;

  var priceorders = 0.obs;
  //var totalPrice;
  var totalcountitems = 0.obs;

  add(var itemsid) async {
    // requestStatus = RequestStatus.loading;
    // update();
    var response = await cartData.addCart(
        _appServices.sharedPreferences.getInt("id")!, itemsid);
    print("=============================== Controller $response ");
    requestStatus.value = handelingData(response);
    if (RequestStatus.success == requestStatus.value) {
      // Start backend
      if (response['status'] == "success") {
        refreshPage();
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم اضافة المنتج الى السلة "));
      } else {
        requestStatus = RequestStatus.failure as Rx<RequestStatus>;
      }
      // End
    }
    //update();
  }

  delete(var itemsid) async {
    requestStatus = RequestStatus.loading as Rx<RequestStatus>;
    update();

    var response = await cartData.deleteCart(
        _appServices.sharedPreferences.getInt("id")!, itemsid);
    print("=============================== Controller $response ");
    requestStatus.value = handelingData(response);
    if (RequestStatus.success == requestStatus.value) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم ازالة المنتج من السلة "));
        // data.addAll(response['data']);
      } else {
        requestStatus = RequestStatus.failure as Rx<RequestStatus>;
      }
      // End
    }
    update();
  }

  resetVarCart() {
    totalcountitems = 0.obs;
    priceorders = 0.obs;
    data.clear();
  }

  refreshPage() {
    resetVarCart();
    view();
  }

  view() async {
    if (requestStatus.value != RequestStatus.success) {
      requestStatus = Rx(RequestStatus.loading);
      update();
    }
    var response =
        await cartData.viewCart(_appServices.sharedPreferences.getInt("id"));
    print("=============================== Controller $response ");
    requestStatus.value = handelingData(response);
    if (RequestStatus.success == requestStatus.value) {
      // Start backend
      if (response['status'] == "success") {
        List datad = response['datacart'];
        try {
          for (var item in datad) {
            data.add(CartModel.fromMap(item));
          }
        } catch (e) {
          print('======================================');
          print("Error in the cart controller $e");
          print('======================================');
        }
      }
    } else {
      requestStatus = RequestStatus.failure as Rx<RequestStatus>;
    }

    //update();
  }

  // fromMap(Map<dynamic, dynamic> map) {
  //   return CartModel(
  //     itemsId: map['items_id'],
  //     itemsName: map['items_name'],
  //     itemsNameAr: map['items_name_ar'],
  //     itemsPrice: map['items_price'],
  //     itemsDiscount: map['items_discount'],
  //     itemsActive: map['items_active'],
  //     itemsCount: map['items_count'],
  //     itemsImage: map['items_image'],
  //     itemsDescription: map['items_description'],
  //     itemsDescriptionAr: map['items_description_ar'],
  //     itemsDatetime: map['items_datetime'],
  //     itemsCategory: map['items_category'],
  //     cartItemCount: map['cart_item_count'],
  //     cartId: map['cart_id'],
  //     cartUsersid: map['cart_user_id'],
  //     cartItemsid: map['cart_items_id'],
  //     totalPrice: map['total_price'],
  //   );
  // }

  @override
  void onInit() {
    view();
    super.onInit();
  }
}
