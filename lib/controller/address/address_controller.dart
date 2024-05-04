
import 'package:ecommercecourse/core/classes/request_status.dart';
import 'package:ecommercecourse/core/constants/routes_name.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/remote/address/address_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../core/functions/handing_data.dart';
import '../../data/model/address.dart';

abstract class AddressController extends GetxController {

  goToAddAddress();

}


class AddressControllerImpl extends AddressController {
  AddressData addressData = AddressData(Get.find());
  final AppServices _appServices = Get.find();
  List addressList = [];
  RequestStatus requestStatus = RequestStatus.notInitialized;




  getAddress() async {
    requestStatus = RequestStatus.loading;
    print("status1:$requestStatus");
    var response = await addressData .getAddress(_appServices.sharedPreferences.getInt("id"));
    requestStatus = handelingData(response);
    print("status2:$requestStatus");
    if (requestStatus == RequestStatus.success &&
        response['status'] == 'success') {
      print("response data:${response['data']} ");
      for(var data in response['data']){
        addressList.add(Address.fromJson(data));
      }

    } else {
      requestStatus;
    }
    update();
  }
  deleteAddress(int id) async {
    var response = await addressData .deleteAddress(id);
    addressList.removeWhere((element) => element.addressId! == id);
    update();

    // if (requestStatus == RequestStatus.success &&
    //     response['status'] == 'success') {
    //   update();
    // } else {
    //
    //   update();
    // }
    // update();
  }

  @override
  goToAddAddress() {
    Get.toNamed(AppRoutes.addAddress);
  }

  @override
  void onInit() {
    getAddress();
    super.onInit();
  }


}