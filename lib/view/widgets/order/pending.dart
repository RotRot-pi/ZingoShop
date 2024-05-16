import 'package:ecommercecourse/core/constants/colors.dart';
import 'package:ecommercecourse/core/constants/routes_name.dart';
import 'package:ecommercecourse/core/constants/spaces.dart';
import 'package:ecommercecourse/data/model/order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:rating_dialog/rating_dialog.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    required this.order,
    required this.controller,
  });

  final Order order;
  final controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.whiteTextColor.withAlpha(150).withAlpha(150),
          border: Border.all(
            color: Colors.grey.shade300,
            width: 1,
            style: BorderStyle.solid,
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 5,
                spreadRadius: 2,
                offset: const Offset(0, 3))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Order Number: ${order.orderId}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Text(
                Jiffy.parse(order.orderDateTime!, pattern: 'yyyy-MM-dd')
                    .fromNow(),
                style: const TextStyle(
                    color: AppColors.primaryColor, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Divider(
            color: Colors.black,
          ),
          Text("Order Date: ${order.orderDateTime}"),
          Text("Order Type: ${controller.printOrderType(order.orderType)}"),
          Text(
              "Order Status: ${controller.printOrderStatus(order.orderStatus)}"),
          Text(
              "Payment Method: ${controller.printPaymentMethod(order.orderPaymentType)}"),
          Text("Order Address: ${order.orderAddressId}"),
          const Divider(
            color: Colors.black,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Order Total Price: ${order.orderTotalprice}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (order.orderStatus == 0)
                    MaterialButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.ordersDetails,
                            arguments: {'order': order});
                      },
                      child: const Text(
                        "Delete",
                      ),
                      color: AppColors.whiteTextColor.withAlpha(150),
                      textColor: AppColors.black,
                    ),
                  AppSpacing.addWidth(w4),
                  if (order.orderStatus == 4 && order.orderRating == 0)
                    MaterialButton(
                      onPressed: () {
                        controller.ratingDialog(order.orderId);
                      },
                      child: const Text(
                        "Rating",
                      ),
                      color: AppColors.whiteTextColor.withAlpha(150),
                      textColor: AppColors.black,
                    ),
                  AppSpacing.addWidth(w4),
                  MaterialButton(
                    onPressed: () {
                      controller.deleteOrder(order.orderId);
                    },
                    child: const Text(
                      "Details",
                    ),
                    color: AppColors.whiteTextColor.withAlpha(150),
                    textColor: AppColors.black,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
