//Create offers controller
import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:ecommercecourse/core/classes/request_status.dart';
import 'package:ecommercecourse/core/constants/routes_name.dart';
import 'package:ecommercecourse/core/functions/handing_data.dart';
import 'package:ecommercecourse/data/datasource/remote/offers_data.dart';
import 'package:ecommercecourse/data/model/items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersController extends SearchControllerMix {
  OffersData offersData = OffersData(crud: Get.find());
  List data = [];

  //getdata methode to get offers from api
  getData() async {
    requestStatus = RequestStatus.loading;
    var response = await offersData.getData();
    requestStatus = handelingData(response);
    if (requestStatus == RequestStatus.success) {
      if (response['status'] == 'success') {
        for (var item in response['data']) {
          data.add(Item.fromMap(item));
        }
        
        update();
      } else {
        requestStatus = RequestStatus.failure;
        update();
      }
    } else {
      requestStatus = RequestStatus.failure;
      update();
    }
  }

  @override
  goToProductDetails(var item) {
    Get.toNamed(AppRoutes.productDetails, arguments: {'item': item});
  }

  @override
  void onInit() {
    searchController = TextEditingController();
    getData();
    super.onInit();
  }
}
