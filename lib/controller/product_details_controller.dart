import 'package:ecommercecourse/controller/cart_controller.dart';
import 'package:ecommercecourse/core/classes/request_status.dart';
import 'package:ecommercecourse/core/functions/handing_data.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/remote/cart_item_data.dart';
import 'package:ecommercecourse/data/model/items.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {}

class ProductDetailsControllerImpl extends ProductDetailsController {
  late Item item;

  CartData cartData = CartData(Get.find());

  late RequestStatus requestStatus;

  final AppServices _appServices = Get.find();

  int countitems = 0;

  intialData() async {
    requestStatus = RequestStatus.loading;
    item = Get.arguments['item'];
    // countitems = await getCountItems(item.itemsId);
    requestStatus = RequestStatus.success;
    update();
  }

  getCountItems(var itemsid) async {
    requestStatus = RequestStatus.loading;
    var response = await cartData.getCountCart(
        _appServices.sharedPreferences.getInt("id")!, itemsid);
    print("=============================== Controller $response ");
    requestStatus = handelingData(response);
    if (RequestStatus.success == requestStatus) {
      // Start backend
      if (response['status'] == "success") {
        int countitems = 0;
        countitems = int.parse(response['data']);
        print("==================================");
        print("$countitems");
        return countitems;
        // data.addAll(response['data']);
      } else {
        requestStatus = RequestStatus.failure;
      }
      // End
    }
  }

  addItems(var itemsid) async {
    requestStatus = RequestStatus.loading;
    update();
    var response = await cartData.addCart(
        _appServices.sharedPreferences.getInt("id"), itemsid);
    print("=============================== Controller $response ");
    requestStatus = handelingData(response);
    if (RequestStatus.success == requestStatus) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم اضافة المنتج الى السلة "));
        //data.add(response['data']);
      } else {
        requestStatus = RequestStatus.failure;
      }
      // End
    }
    update();
  }

  deleteitems(var itemsid) async {
    requestStatus = RequestStatus.loading;
    update();

    var response = await cartData.deleteCart(
        _appServices.sharedPreferences.getInt("id")!, itemsid);
    print("=============================== Controller $response ");
    requestStatus = handelingData(response);
    if (RequestStatus.success == RequestStatus) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم ازالة المنتج من السلة "));
        // data.addAll(response['data']);
      } else {
        requestStatus = RequestStatus.failure;
      }
      // End
    }
    update();
  }

  List subitems = [
    {"name": "red", "id": 1, "active": '0'},
    {"name": "yallow", "id": 2, "active": '0'},
    {"name": "black", "id": 3, "active": '1'}
  ];

  add() {
    addItems(item.itemsId);
    countitems++;
    update();
  }

  remove() {
    if (countitems > 0) {
      deleteitems(item.itemsId);
      countitems--;
      update();
    }
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
