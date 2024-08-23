// ignore_for_file: prefer_const_constructors
import 'package:zingoshop/controller/cart_controller.dart';
import 'package:zingoshop/core/constants/api_link.dart';
import 'package:zingoshop/core/constants/colors.dart';
import 'package:zingoshop/data/model/cart.dart';
import 'package:zingoshop/view/widgets/cart/bottomnavbarcard.dart';
import 'package:zingoshop/view/widgets/cart/customitemscartlist.dart';
import 'package:zingoshop/view/widgets/cart/topcardcart.dart';
import 'package:zingoshop/view/widgets/handeling_data_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    return Scaffold(
        appBar: AppBar(
          title: Text("my_cart".tr),
          centerTitle: true,
        ),
        resizeToAvoidBottomInset: true,
        bottomNavigationBar: GetBuilder<CartController>(
            builder: (controller) => BottomNavgationBarCart(
                  controllercoupon: controller.couponController,
                  onApplyCoupon: () => controller.checkCoupon(),
                  onPressedOrder: () => controller.goToCheckout(),
                  price: controller.ordersPrice.toStringAsFixed(2),
                  discount: "${controller.discountCoupon}",
                  totalprice: controller.ordersPrice.toStringAsFixed(2),
                )),
        body: GetBuilder<CartController>(
            builder: (controller) => RefreshIndicator(
                  color: AppColors.thirdColor,
                  backgroundColor: AppColors.white,
                  onRefresh: () => controller.refreshPage(),
                  triggerMode: RefreshIndicatorTriggerMode.anywhere,
                  child: HandelingDataView(
                    requestStatus: controller.requestStatus,
                    child: ListView(
                      children: [
                        SizedBox(height: 10),
                        TopCardCart(
                            message:
                                "${"you_have".tr} ${controller.totalcountitems} ${"items_in_your_list".tr}"),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              ...List.generate(
                                controller.data.length,
                                (index) => GetBuilder<CartController>(
                                    builder: (controller) {
                                  CartModel item = controller.data[index];
                                  return CustomItemsCartList(
                                      onCountChanged: (newCount) =>
                                          controller.updateItemCount(
                                              item.itemsId!, newCount),
                                      imageName:
                                          "${ApiLink.itemsImageFolder}${item.itemsImage}",
                                      name: "${item.itemsName}",
                                      price: "${item.itemsPrice} \$",
                                      count: "${item.cartItemCount}");
                                }),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )));
  }
}
