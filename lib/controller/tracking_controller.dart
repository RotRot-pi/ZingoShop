import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zingoshop/core/classes/request_status.dart';
import 'package:zingoshop/data/model/order_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

// import '../core/services/services.dart';

class TrackingController extends GetxController {
  //Note:You can animate the camera to follow the delivery location using google maps

  // final AppServices _appServices = Get.find();
  late MapController mapController;
  late MapOptions mapOptions;
  late OrderDetails orderDetails;
  double zoom = 10;
  List<Marker> markers = [];
  late double currentLat;
  late double currentLng;

  late double destLat;
  late double destLng;
  List<Polyline> polylines = [];

  List data = [];
  late RequestStatus requestStatus;
  //TODO: center camera on delivery location

  initialData() {
    // markers.clear();
    requestStatus = RequestStatus.loading;
    currentLat = orderDetails.addressLat!;
    currentLng = orderDetails.addressLong!;

    // markers.removeWhere(
    //     (element) => element.key == const Key("Destination Marker"));
    markers.add(
      Marker(
        key: const Key("Current Marker"),
        point: LatLng(orderDetails.addressLat!, orderDetails.addressLong!),
        child: const Icon(Icons.location_on),
      ),
    );

    // // Add the camera animation here
    // markers
    //     .removeWhere((element) => element.key == const Key("Current Marker"));
    // markers.add(
    //   Marker(
    //     key: const Key("Current Marker"),
    //     point: LatLng(position.latitude, position.longitude),
    //     child: const Icon(Icons.location_on),
    //   ),
    // );
    // });

    // update();
  }

  getDeliveryLocation() {
    FirebaseFirestore.instance
        .collection("delivery")
        .doc(orderDetails.orderId.toString())
        .snapshots()
        .listen((event) {
      if (event.exists) {
        destLat = double.parse(event.get("lat"));
        destLng = double.parse(event.get("lng"));
        updatedDeliveryLocationMarker(destLat, destLng);
      }
    });
  }

  updatedDeliveryLocationMarker(double lat, double lng) {
    polylines.clear();
    polylines.add(Polyline(
      points: [
        LatLng(currentLat, currentLng),
        LatLng(lat, lng),
      ],
    ));
    markers.removeWhere(
        (element) => element.key == const Key("Destination Marker"));
    markers.add(
      Marker(
        key: const Key("Destination Marker"),
        point: LatLng(lat, lng),
        child: const Icon(Icons.location_on),
      ),
    );

    //center camera to delivery location
    // mapCamera.latLngToScreenPoint(LatLng(lat, lng));
    requestStatus = RequestStatus.success;
    update();
  }

  getInitialCenter() {
    return LatLng(destLat, destLng);
  }
  // setMarker(LatLng latLng) {
  //   if (orderDetails.orderType == 0) {
  //     markers.clear();
  //     markers.add(
  //       Marker(
  //         point: latLng,
  //         child: const Icon(Icons.location_on),
  //       ),
  //     );

  //     // lat = order.addressLat ?? latLng.latitude;
  //     // lng = order.addressLong ?? latLng.longitude;
  //   }
  //   update();
  // }

  zoomIn() {
    if (zoom < 150) {
      zoom += 0.5;

      update();
    }
    update();
  }

  zoomOut() {
    if (zoom > 1) {
      zoom -= 0.5;

      update();
    }
    update();
  }

  @override
  void onInit() {
    requestStatus = RequestStatus.notInitialized;
    orderDetails = Get.arguments['order'];
    mapController = MapController();
    // currentLat = 0.0;
    // currentLng = 0.0;
    // destLat = 0.0;
    // destLng = 0.0;
    initialData();
    getDeliveryLocation();

    super.onInit();
  }

  @override
  void onClose() {
    mapController.dispose();
    super.onClose();
  }
}
