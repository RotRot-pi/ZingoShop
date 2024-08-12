import 'package:ecommercecourse/view/widgets/handeling_data_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../controller/address/add_address_controller.dart';
import '../../../core/constants/colors.dart';



class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=>AddAddressControllerImpl());
    return Scaffold(
      body: GetBuilder<AddAddressControllerImpl>(
        builder: (controller) {

            return HandelingDataView(
              requestStatus: controller.requestStatus,
              child: Stack(
                children: [
                  FlutterMap(



                    options: MapOptions(

                      onTap: (TapPosition tapPosition,LatLng latLng) => controller.setMarker(latLng),
                      initialCenter: LatLng(
                        controller.position.latitude,
                        controller.position.longitude,
                      ),
                      initialZoom: 9.2,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.example.app',
                      ),
                      MarkerLayer(markers:controller.markers ),
                      RichAttributionWidget(
                        attributions: [
                          TextSourceAttribution(
                            'OpenStreetMap contributors',
                            onTap: () => launchUrl(Uri.parse('https://openstreetmap.org')),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                      bottom: 10,
                      left: 10,

                      child: ElevatedButton(
                        onPressed: () => controller.addAddress(),
                        style: ElevatedButton.styleFrom(

                          backgroundColor: AppColors.primaryColor,

                        ),

                        child:  Text('Add',
                          style: TextStyle(color: AppColors.whiteTextColor,
                            fontWeight: FontWeight.bold,fontSize: 16.sp),),
          ),), ],
              ),
            );


        },
      ),
    );
  }
}
