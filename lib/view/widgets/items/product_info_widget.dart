import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:zingoshop/controller/product_details_controller.dart';
import 'package:zingoshop/core/constants/colors.dart';
import 'package:zingoshop/core/constants/spaces.dart';
import 'package:zingoshop/view/widgets/product_details/priceandcount.dart';

class ProductInfoWidget extends GetView<ProductDetailsControllerImpl> {
  const ProductInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 1),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: controller.productAnimationController,
          curve: Curves.easeInOut,
        ),
      ),
      child: Container(
        padding: AppSpacing.addEdgeInsetsSymmetric(horizontal: p20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(controller.item.itemsName,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  color: AppColors.black, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Container(
            alignment: Alignment.bottomCenter,
            height: h24,
            child: Row(
              children: [
                ...List.generate(
                    math.Random().nextInt(6),
                    (index) => const Icon(
                          Icons.star_outlined,
                          size: s24,
                          color: AppColors.sixthColor,
                        ))
              ],
            ),
          ),
          const SizedBox(height: 10),
          PriceAndCountItems(
              onAdd: () {
                controller.add();
              },
              onRemove: () {
                controller.remove();
              },
              price: controller.item.itemsPriceAfterDiscount == null
                  ? "${controller.item.itemsPrice}"
                  : "${controller.item.itemsPriceAfterDiscount}",
              count: "${controller.countitems}"),
          const SizedBox(height: 10),
          Text(controller.item.itemsDescription,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: s12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black)),
          const SizedBox(height: 10),
        ]),
      ),
    );
  }
}
