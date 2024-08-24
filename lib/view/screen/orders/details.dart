import 'package:zingoshop/controller/order/details.dart';
import 'package:zingoshop/core/constants/colors.dart';
import 'package:zingoshop/core/constants/spaces.dart';
import 'package:zingoshop/data/model/order_details.dart';
import 'package:zingoshop/view/widgets/handeling_data_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class OrdersDetailsScreen extends StatelessWidget {
  const OrdersDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersDetailsController());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "order_details".tr,
            style: const TextStyle(color: AppColors.white),
          ),
          centerTitle: true,
        ),
        body: Container(
          padding:
              AppSpacing.addEdgeInsetsSymmetric(vertical: p16, horizontal: p32),
          child: GetBuilder<OrdersDetailsController>(builder: (controller) {
            return HandelingDataView(
              requestStatus: controller.requestStatus,
              child: Column(
                children: [
                  Container(
                    padding: AppSpacing.addEdgeInsetsAll(p12),
                    child: Table(
                        border: TableBorder.all(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(r8),
                          width: 1.5,
                        ),
                        children: [
                          TableRow(children: [
                            Text("item".tr,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: s16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryColor)),
                            Text("qty".tr,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: s16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryColor)),
                            Text("price".tr,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: s16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryColor))
                          ]),
                          ...List.generate(controller.data.length, (index) {
                            OrderDetails order = controller.data[index];
                            return TableRow(children: [
                              Text(
                                "${order.itemsName}",
                                style: const TextStyle(
                                  color: AppColors.black,
                                  fontSize: s14,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "${order.cartItemCount}",
                                style: const TextStyle(
                                  color: AppColors.black,
                                  fontSize: s14,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "${order.itemsPriceAtPurchase}",
                                style: const TextStyle(
                                  color: AppColors.black,
                                  fontSize: s14,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ]);
                          })
                        ]),
                  ),
                  AppSpacing.addHeigh(h10),
                  Card(
                    color: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(r8),
                      side: const BorderSide(
                          color: AppColors.primaryColor, width: 1.5),
                    ),
                    child: Container(
                      padding: AppSpacing.addEdgeInsetsAll(p12),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "${"total".tr}: ${controller.orderDetails.orderPrice}\$",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: AppColors.black,
                              fontSize: s16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  AppSpacing.addHeigh(h10),
                  if (controller.orderDetails.orderType == 0)
                    ListTile(
                        title: Text(
                          "shipping_address".tr,
                          style: const TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: s16,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "${controller.orderDetails.addressStreet}, ${controller.orderDetails.addressCity}",
                          style: const TextStyle(
                            color: AppColors.black,
                            fontSize: s14,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                  AppSpacing.addHeigh(h10),
                  if (controller.orderDetails.orderType == 0)
                    SizedBox(
                      height: 300,
                      width: double.infinity,
                      child: GetBuilder<OrdersDetailsController>(
                        builder: (controller) => Stack(
                          children: [
                            FlutterMap(
                              mapController: controller.mapController,
                              options: MapOptions(
                                // onMapReady: () => controller.setMarker(),
                                initialCenter: LatLng(
                                  controller.orderDetails.addressLat ?? 0.0,
                                  controller.orderDetails.addressLong ?? 0.0,
                                ),
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
                                      onTap: () => launchUrl(Uri.parse(
                                          'https://openstreetmap.org')),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Positioned(
                                bottom: 2,
                                left: 4,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: const CircleBorder(),
                                          backgroundColor:
                                              AppColors.primaryColor,
                                        ),
                                        onPressed: () {
                                          controller.zoomIn();
                                        },
                                        child: const Icon(
                                          Icons.add,
                                          color: AppColors.white,
                                        ),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: const CircleBorder(),
                                          backgroundColor:
                                              AppColors.primaryColor,
                                        ),
                                        onPressed: () {
                                          controller.zoomOut();
                                        },
                                        child: const Icon(
                                          Icons.remove,
                                          color: AppColors.white,
                                        ),
                                      ),
                                      AppSpacing.addHeigh(h12),
                                      FilledButton(
                                          onPressed: () {
                                            controller.goToOrderTracking(
                                                controller.orderDetails);
                                          },
                                          style: FilledButton.styleFrom(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: p12,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(r20),
                                              ),
                                            ),
                                            backgroundColor:
                                                AppColors.primaryColor,
                                          ),
                                          child: Text(
                                            "track_order".tr,
                                            style: const TextStyle(
                                              color: AppColors.white,
                                              fontSize: s14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ))
                                    ]))
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            );
          }),
        ));
  }
}
