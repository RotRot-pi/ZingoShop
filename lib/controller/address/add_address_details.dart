import 'package:ecommercecourse/core/classes/request_status.dart';
import 'package:ecommercecourse/core/constants/routes_name.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/remote/address/address_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/functions/handing_data.dart';

abstract class AddAddressDetailsController extends GetxController {}

class AddAddressDetailsControllerImpl extends AddAddressDetailsController {
  AddressData addressData = AddressData(Get.find());
  final AppServices _appServices = Get.find();
  late TextEditingController cityController;
  late TextEditingController streetController;
  late TextEditingController nameController;
  List addressList = [];
  RequestStatus requestStatus = RequestStatus.notInitialized;
  double lat = 0;
  double lng = 0;

  addAddress() async {
    requestStatus = RequestStatus.loading;
    update();
    var response = await addressData.addAddress(
        _appServices.sharedPreferences.getInt("id"),
        nameController.text,
        cityController.text,
        streetController.text,
        lat.toString(),
        lng.toString());
    requestStatus = handelingData(response);

    if (requestStatus == RequestStatus.success &&
        response['status'] == 'success') {
      Get.offAllNamed(AppRoutes.home);
    } else {
      requestStatus = RequestStatus.failure;
    }
    update();
  }

  @override
  void onInit() {
    cityController = TextEditingController();
    streetController = TextEditingController();
    nameController = TextEditingController();
    lat = Get.arguments['lat'];
    lng = Get.arguments['lng'];
    super.onInit();
  }

  @override
  void dispose() {
    cityController.dispose();
    streetController.dispose();
    nameController.dispose();
    super.dispose();
  }
}
