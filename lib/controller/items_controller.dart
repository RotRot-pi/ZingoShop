import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:ecommercecourse/core/classes/request_status.dart';
import 'package:ecommercecourse/core/constants/routes_name.dart';
import 'package:ecommercecourse/core/functions/handing_data.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/remote/item_data.dart';
import 'package:ecommercecourse/data/model/items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ItemsController extends SearchControllerMix {
  initialData();
  getItems(int categoryId);
  changeCategory(int index, var categoryId);
  @override
  goToProductDetails(Item item);
}

class ItemsControllerImpl extends ItemsController {
  final AppServices _appServices = Get.find();
  ItemData itemData = ItemData(crud: Get.find());

  List categories = [];
  List items = [];

  int? categoryIndex;
  late int categoryId;
  String? deliveryTime = "";

  @override
  getItems(int categoryId) async {
    items.clear();
    requestStatus = RequestStatus.loading;

    var response = await itemData.getData(
        categoryId, _appServices.sharedPreferences.getInt("id"));
    requestStatus = handelingData(response);

    if (requestStatus == RequestStatus.success &&
        response['status'] == 'success') {
      // response['categories'].forEach((element) {
      //   categories.add(Item.fromMap(element));
      // });
      response['data'].forEach((element) {
        items.add(Item.fromMap(element));
      });
    } else if (response['status'] == 'failure') {
      requestStatus = RequestStatus.failure;

      update();
    } else {
      requestStatus = RequestStatus.failure;
    }

    update();
  }

  @override
  initialData() {
    searchController = TextEditingController();
    categories = Get.arguments['categories'];
    categoryIndex = Get.arguments['categoryIndex'];
    categoryId = Get.arguments['categoryId'];
    deliveryTime = _appServices.sharedPreferences.getString("deliveryTime");
  }

  @override
  changeCategory(int index, var categoryId) {
    categoryIndex = index;
    categoryId = categoryId;
    getItems(categoryId);

    update();
  }

  @override
  goToProductDetails(Item item) {
    Get.toNamed(AppRoutes.productDetails, arguments: {'item': item});
  }

  @override
  void onInit() {
    initialData();
    getItems(categoryId);
    super.onInit();
  }
}
