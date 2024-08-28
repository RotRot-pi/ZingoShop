import 'dart:math' as math;
import 'package:zingoshop/controller/product_details_controller.dart';
import 'package:zingoshop/core/constants/colors.dart';
import 'package:zingoshop/core/constants/spaces.dart';
import 'package:zingoshop/view/widgets/handeling_data_view.dart';
import 'package:zingoshop/view/widgets/items/product_info_widget.dart';
import 'package:zingoshop/view/widgets/product_details/priceandcount.dart';
import 'package:zingoshop/view/widgets/product_details/toppageproductdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImpl controller =
        Get.put(ProductDetailsControllerImpl());
    return SafeArea(
      child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColors.transparent,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: AppColors.black),
              onPressed: () => Get.back(),
            ),
          ),
          bottomNavigationBar: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: 40,
              child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: AppColors.secondaryColor,
                  onPressed: () {
                    controller.addItems(controller.item.itemsId);
                  },
                  child: Text(
                    "add_to_cart".tr,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ))),
          body: GetBuilder<ProductDetailsControllerImpl>(
              builder: (controller) => HandelingDataView(
                  requestStatus: controller.requestStatus,
                  child: SingleChildScrollView(
                      child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 800),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TopProductPageDetails(),
                          AppSpacing.addHeigh(h24),
                          const ProductInfoWidget()
                        ]),
                  ))))),
    );
  }
}
