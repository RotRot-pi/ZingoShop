import 'package:zingoshop/core/classes/request_status.dart';
import 'package:zingoshop/core/constants/routes_name.dart';
import 'package:zingoshop/core/functions/handing_data.dart';
import 'package:zingoshop/core/services/services.dart';
import 'package:zingoshop/data/datasource/remote/order/details.dart';
import 'package:zingoshop/data/model/order_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class OrdersDetailsController extends GetxController {
  final AppServices _appServices = Get.find();
  final OrderDetailsData orderDetailsData = OrderDetailsData(crud: Get.find());
  late MapController mapController;
  late MapCamera mapCamera;
  late Position position;
  late OrderDetails orderDetails;
  double zoom = 10;

  List<Marker> markers = [];
  // late double lat;
  // late double lng;

  List data = [];
  late RequestStatus requestStatus;
  getData() async {
    requestStatus = RequestStatus.loading;

    if (orderDetails.orderType == 0) {
      markers.clear();
      markers.add(Marker(
          point: LatLng(orderDetails.addressLat!, orderDetails.addressLong!),
          child: const Icon(Icons.location_on)));
    }
    var response =
        await orderDetailsData.getData(orderDetails.orderId.toString());
    requestStatus = handelingData(response);

    if (requestStatus == RequestStatus.success &&
        response['status'] == 'success') {
      for (var item in response['data']) {
        data.add(OrderDetails.fromJson(item));
      }
      update();
    } else {
      requestStatus = RequestStatus.failure;
    }
    update();
  }

  // setMarker([LatLng? latLng]) {
  //   if (orderDetails.orderType == 0) {
  //     markers.clear();
  //     lat = orderDetails.addressLat!;
  //     lng = orderDetails.addressLong!;

  //     markers.add(
  //       Marker(
  //         point: LatLng(lng, lat),
  //         child: const Icon(Icons.location_on),
  //       ),
  //     );
  //   }
  //   update();
  // }

  zoomIn() {
    if (zoom < 150) {
      zoom += 0.5;
    }
    update();
  }

  zoomOut() {
    if (zoom > 1) {
      zoom -= 0.5;
    }
    update();
  }

  goToOrderTracking(OrderDetails order) {
    Get.toNamed(AppRoutes.orderTracking, arguments: {"order": order});
  }

  @override
  void onInit() {
    orderDetails = Get.arguments['order'];
    mapController = MapController();
    position = _appServices.position;
    getData();
    super.onInit();
  }
}
