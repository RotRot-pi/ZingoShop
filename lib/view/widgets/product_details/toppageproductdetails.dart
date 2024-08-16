import 'package:cached_network_image/cached_network_image.dart';
import 'package:zingoshop/controller/product_details_controller.dart';
import 'package:zingoshop/core/constants/api_link.dart';
import 'package:zingoshop/core/constants/colors.dart';
import 'package:zingoshop/core/constants/spaces.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopProductPageDetails extends GetView<ProductDetailsControllerImpl> {
  const TopProductPageDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: h180,
          decoration: const BoxDecoration(color: AppColors.secondaryColor),
        ),
        Positioned(
            top: h32,
            right: Get.width / 8,
            left: Get.width / 8,
            child: Hero(
              tag: "${controller.item.itemsId}",
              child: CachedNetworkImage(
                imageUrl:
                    "${ApiLink.itemsImageFolder}/${controller.item.itemsImage}",
                height: h260,
                fit: BoxFit.fill,
              ),
            ))
      ],
    );
  }
}
