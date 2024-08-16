import 'package:zingoshop/controller/product_details_controller.dart';
import 'package:zingoshop/core/constants/colors.dart';
import 'package:zingoshop/core/constants/spaces.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubitemsList extends GetView<ProductDetailsControllerImpl> {
  const SubitemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          controller.subitems.length,
          (index) => Container(
            margin: AppSpacing.addEdgeInsetsOnly(right: h10),
            alignment: Alignment.center,
            padding: AppSpacing.addEdgeInsetsOnly(bottom: h4),
            height: h64,
            width: w100,
            decoration: BoxDecoration(
                color: controller.subitems[index]['active'] == "1"
                    ? AppColors.fifthColor
                    : Colors.white,
                border: Border.all(color: AppColors.fourthColor),
                borderRadius: BorderRadius.circular(r12)),
            child: Text(controller.subitems[index]['name'],
                style: TextStyle(
                    color: controller.subitems[index]['active'] == "1"
                        ? Colors.white
                        : AppColors.fourthColor,
                    fontWeight: FontWeight.bold)),
          ),
        )
      ],
    );
  }
}
