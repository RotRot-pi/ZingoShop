// ignore_for_file: prefer_const_constructors
import 'package:ecommercecourse/controller/cart_controller.dart';
import 'package:ecommercecourse/view/widgets/cart/appbarcart.dart';
import 'package:ecommercecourse/view/widgets/cart/custom_bottom_navgationbar_cart.dart';
import 'package:ecommercecourse/view/widgets/cart/customitemscartlist.dart';
import 'package:ecommercecourse/view/widgets/cart/topcardcart.dart';
import 'package:ecommercecourse/view/widgets/handeling_data_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    return Scaffold(
        bottomNavigationBar: GetBuilder<CartController>(
            builder: (controller) => BottomNavgationBarCart(
                price: "${cartController.priceorders}",
                shipping: "300",
                totalprice: "1500")),
        body: GetBuilder<CartController>(
            builder: ((controller) => HandelingDataView(
                requestStatus: controller.requestStatus,
                child: ListView(
                  children: [
                    TopAppbarCart(
                      title: 'My Cart',
                    ),
                    SizedBox(height: 10),
                    TopCardCart(
                        message:
                            "You Have ${cartController.totalcountitems} Items in Your List"),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ...List.generate(
                            cartController.data.length,
                            (index) => CustomItemsCartList(
                                onAdd: () async {
                                  await cartController
                                      .add(cartController.data[index].itemsId!);
                                  cartController.refreshPage();
                                },
                                onRemove: () async {
                                  await cartController.delete(
                                      cartController.data[index].itemsId!);
                                  cartController.refreshPage();
                                },
                                imageName:
                                    "${cartController.data[index].itemsImage}",
                                name: "${cartController.data[index].itemsName}",
                                price:
                                    "${cartController.data[index].itemsPrice} \$",
                                count:
                                    "${cartController.data[index].itemsCount}"),
                          )
                        ],
                      ),
                    )
                  ],
                )))));
  }
}
