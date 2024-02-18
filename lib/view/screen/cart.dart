import 'package:ecommercecourse/controller/cart_controller.dart';
import 'package:ecommercecourse/data/model/cart_item.dart';
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
    //Todo: refactor the cart widgets
    //Todo: refactor the ui
    //Todo: connect with the add and delete from cart api
    //Todo: work on the
    Get.put(CartControllerImpl());
    return Scaffold(
        bottomNavigationBar: GetBuilder<CartControllerImpl>(
          builder: (controller) => BottomNavgationBarCart(
            price: "\$${controller.cartTotalPrice}",
            shipping: "0",
            totalprice: "\$${controller.cartTotalPrice * 1}",
          ),
        ),
        body: GetBuilder<CartControllerImpl>(builder: (controller) {
          return HandelingDataView(
            requestStatus: controller.requestStatus,
            child: Column(children: [
              TopAppbarCart(
                title: "Cart",
              ),
              TopCardCart(message: "This is an empty cart"),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: ListView.builder(
                    itemCount: controller.cartItems.length,
                    itemBuilder: (context, index) {
                      CartItem item = controller.cartItems[index];
                      return CustomItemsCartList(
                          itemId: item.itemsId,
                          name: item.itemsName,
                          price: "${item.itemsPrice} \$",
                          count: "${item.cartItemCount}");
                    },
                  ),
                ),
              ),
            ]),
          );
        }));
  }
}
