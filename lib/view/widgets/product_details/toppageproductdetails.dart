import 'package:cached_network_image/cached_network_image.dart';
import 'package:zingoshop/controller/product_details_controller.dart';
import 'package:zingoshop/core/constants/api_link.dart';
import 'package:zingoshop/core/constants/spaces.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopProductPageDetails extends GetView<ProductDetailsControllerImpl> {
  const TopProductPageDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, -0.75),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: controller.productAnimationController,
            curve: Curves.easeInOut,
          ),
        ),
        child: Container(
          height: Get.height * 0.42,
          width: Get.width,
          decoration: const BoxDecoration(
            color: Color(0xFFE5E6E8),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(200),
              bottomLeft: Radius.circular(200),
            ),
          ),
          child: FittedBox(
            fit: BoxFit.none,
            child: CachedNetworkImage(
              imageUrl:
                  "${ApiLink.itemsImageFolder}/${controller.item.itemsImage}",
              height: h200,
              fit: BoxFit.fill,
            ),
          ),
        ));
  }
}
