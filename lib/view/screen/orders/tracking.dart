import 'package:latlong2/latlong.dart';
import 'package:zingoshop/controller/tracking_controller.dart';
import 'package:zingoshop/core/constants/colors.dart';
import 'package:zingoshop/core/constants/spaces.dart';
import 'package:zingoshop/view/widgets/handeling_data_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TrackingController());
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Order Tracking",
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: AppSpacing.addEdgeInsetsOnly(
            top: p16,
          ),
          child: GetBuilder<TrackingController>(builder: (controller) {
            return HandelingDataView(
              requestStatus: controller.requestStatus,
              child: Stack(
                children: [
                  FlutterMap(
                    mapController: controller.mapController,
                    options: MapOptions(
                      initialCenter:
                          controller.getInitialCenter() ?? const LatLng(0, 0),
                      initialZoom: controller.zoom,
                      minZoom: controller.zoom,
                      maxZoom: controller.zoom,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.example.app',
                      ),
                      MarkerLayer(markers: controller.markers),
                      RichAttributionWidget(
                        attributions: [
                          TextSourceAttribution(
                            'OpenStreetMap contributors',
                            onTap: () => launchUrl(
                                Uri.parse('https://openstreetmap.org')),
                          ),
                        ],
                      ),
                      PolylineLayer(polylines: controller.polylines),
                    ],
                  ),
                  Positioned(
                      bottom: 10,
                      left: 10,
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        ElevatedButton(
                          onPressed: () {
                            controller.zoomIn();
                          },
                          child: const Icon(Icons.add),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            controller.zoomOut();
                          },
                          child: const Icon(Icons.remove),
                        ),
                      ]))
                ],
              ),
            );
          }),
        ));
  }
}
