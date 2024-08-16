import 'package:zingoshop/core/classes/request_status.dart';
import 'package:zingoshop/core/constants/routes_name.dart';
import 'package:zingoshop/core/functions/handing_data.dart';
import 'package:zingoshop/core/services/services.dart';
import 'package:zingoshop/data/datasource/remote/home_data.dart';
import 'package:zingoshop/data/model/categories.dart';
import 'package:zingoshop/data/model/items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeController extends SearchControllerMix {
  getData();
  initialData();
  goToItems(List categories, int categoryIndex, var categoryId);
  @override
  goToProductDetails(Item item);
}

class HomeControllerImpl extends HomeController {
  final AppServices _appServices = Get.find();
  late String username;
  late int id;
  late String language;
  String titleHomeCard = "";
  String descriptionHomeCard = "";
  String deliveryTime = "";

  List<Category> categories = [];
  List<Item> items = [];
  List homeCartSettings = [];

  @override
  getData() async {
    requestStatus = RequestStatus.loading;

    var response = await homeData.getData();
    requestStatus = handelingData(response);

    if (requestStatus == RequestStatus.success &&
        response['status'] == 'success') {
      for (var element in response['categories']) {
        categories.add(Category.fromMap(element));
      }

      for (var element in response['itemsTopSellingView']) {
        items.add(Item.fromMap(element));
      }

      for (var element in response['home_cart_settings']) {
        homeCartSettings.add(element as Map);
      }
      titleHomeCard = homeCartSettings[0]['home_cart_settings_title'];
      descriptionHomeCard = homeCartSettings[0]['home_cart_settings_body'];
      deliveryTime = homeCartSettings[0]['delivery_time'].toString();
      //deliveryTime: You can add it to shared preferences or wherever you want to save it
      _appServices.sharedPreferences.setString("deliveryTime", deliveryTime);
    } else {
      requestStatus = RequestStatus.failure;
    }

    update();
  }

  @override
  initialData() {
    id = _appServices.sharedPreferences.getInt("id")!;
    username = _appServices.sharedPreferences.getString("username")!;
    language = _appServices.sharedPreferences.getString("lang")!;
  }

  @override
  goToItems(List categories, int categoryIndex, var categoryId) {
    Get.toNamed(AppRoutes.items, arguments: {
      'categories': categories,
      'categoryIndex': categoryIndex,
      'categoryId': categoryId
    });
  }

  @override
  goToProductDetails(Item item) {
    Get.toNamed(AppRoutes.productDetails, arguments: {'item': item});
  }

  @override
  void onInit() {
    searchController = TextEditingController();
    initialData();
    getData();
    super.onInit();
  }
}

class SearchControllerMix extends GetxController {
  HomeData homeData = HomeData(crud: Get.find());
  late TextEditingController searchController;
  RequestStatus requestStatus = RequestStatus.notInitialized;
  bool isSeaching = false;
  List searchedItems = [];

  isSearching(String value) {
    if (value.isEmpty || value == "") {
      requestStatus = RequestStatus.notInitialized;
      isSeaching = false;
    }
    update();
  }

  onItemsSearch() {
    isSeaching = true;
    update();
    searchItems();
    update();
  }

  searchItems() async {
    searchedItems.clear();
    if (searchController.text.isEmpty) {
      return;
    }
    requestStatus = RequestStatus.loading;

    var response = await homeData.searchData(searchController.text);

    requestStatus = handelingData(response);
    if (requestStatus == RequestStatus.success) {
      if (response['status'] == 'success') {
        response['data'].forEach((element) {
          searchedItems.add(Item.fromMap(element));
        });
      } else {
        requestStatus = RequestStatus.failure;
      }
    }
    update();
  }

  goToProductDetails(Item item) {
    Get.toNamed(AppRoutes.productDetails, arguments: {'item': item});
  }
}
