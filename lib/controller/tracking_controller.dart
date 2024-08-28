import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zingoshop/core/classes/request_status.dart';
import 'package:zingoshop/data/model/order_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class TrackingController extends GetxController {
  late MapController mapController;
  late OrderDetails orderDetails;
  double zoom = 10;
  List<Marker> markers = [];
  late double currentLat;
  late double currentLng;

  double? destLat;
  double? destLng;
  List<Polyline> polylines = [];

  late RequestStatus requestStatus;

  initialData() {
    requestStatus = RequestStatus.loading;
    currentLat = orderDetails.addressLat!;
    currentLng = orderDetails.addressLong!;

    markers.add(
      Marker(
        key: const Key("Current Marker"),
        point: LatLng(currentLat, currentLng),
        child: const Icon(Icons.location_on),
      ),
    );

    update();
  }

  getDeliveryLocation() {
    FirebaseFirestore.instance
        .collection("delivery")
        .doc(orderDetails.orderId.toString())
        .snapshots()
        .listen((event) {
      if (event.exists) {
        destLat = double.tryParse(event.get("lat"));
        destLng = double.tryParse(event.get("lng"));
        if (destLat != null && destLng != null) {
          updatedDeliveryLocationMarker(destLat!, destLng!);
        } else {
          handleNoDeliveryData();
        }
      } else {
        handleNoDeliveryData();
      }
    });
  }

  void handleNoDeliveryData() {
    requestStatus = RequestStatus.failure;
    update();
    Get.snackbar(
      "No Delivery Data",
      "There is currently no delivery information available.",
      snackPosition: SnackPosition.BOTTOM,
    );
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

    requestStatus = RequestStatus.success;
    update();
  }

  LatLng? getInitialCenter() {
    return destLat != null && destLng != null
        ? LatLng(destLat!, destLng!)
        : null;
  }

  zoomIn() {
    if (zoom < 18) {
      zoom += 0.5;
      update();
    }
  }

  zoomOut() {
    if (zoom > 3) {
      zoom -= 0.5;
      update();
    }
  }

  @override
  void onInit() {
    requestStatus = RequestStatus.notInitialized;
    orderDetails = Get.arguments['order'];
    mapController = MapController();
    currentLat = 0.0;
    currentLng = 0.0;
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
