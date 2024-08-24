import 'package:zingoshop/controller/notification_controller.dart';
import 'package:zingoshop/core/constants/colors.dart';
import 'package:zingoshop/core/constants/routes_name.dart';
import 'package:zingoshop/data/model/notification.dart';
import 'package:zingoshop/view/widgets/customappbar.dart';
import 'package:zingoshop/view/widgets/handeling_data_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationController());
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('notifications'.tr,
      //       style: const TextStyle(
      //           fontWeight: FontWeight.bold, color: AppColors.white)),
      // ),
      body: Column(
        children: [
          GetBuilder<NotificationController>(
            builder: (controller) {
              return HandelingDataView(
                  requestStatus: controller.requestStatus,
                  child: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (context, i) {
                      final Notifications notification = controller.data[i];
                      return ListTile(
                          title: Text(
                            notification.notificationTitle,
                            style: const TextStyle(
                              fontSize: 18,
                              color: AppColors.black,
                            ),
                          ),
                          subtitle: Text(
                            notification.notificationBody,
                            style: const TextStyle(
                              fontSize: 16,
                              color: AppColors.greyColor,
                            ),
                          ),
                          trailing: Text(
                            '${Jiffy.parse(notification.notificationTime, pattern: 'yyyy-MM-dd HH:mm:ss').fromNow()} ${'ago'.tr}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.primaryColor,
                            ),
                          ));
                    },
                  ));
            },
          ),
        ],
      ),
    );
  }
}
