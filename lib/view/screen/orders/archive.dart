import 'package:zingoshop/controller/order/archive.dart';
import 'package:zingoshop/core/constants/colors.dart';
import 'package:zingoshop/data/model/order_details.dart';
import 'package:zingoshop/view/widgets/order/pending.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/handeling_data_view.dart';

class ArchiveOrdersScreen extends StatelessWidget {
  const ArchiveOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ArchivingOrderController());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "archive".tr,
            style: const TextStyle(color: AppColors.primaryColor),
          ),
          centerTitle: true,
        ),
        body: GetBuilder<ArchivingOrderController>(
            builder: (controller) => HandelingDataView(
                requestStatus: controller.requestStatus,
                child: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) {
                      OrderDetails order = controller.data[index];
                      return OrderCard(order: order, controller: controller);
                    }))));
  }
}
