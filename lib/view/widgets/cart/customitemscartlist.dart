import 'package:ecommercecourse/controller/cart_controller.dart';
import 'package:ecommercecourse/core/constants/colors.dart';
import 'package:ecommercecourse/core/constants/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomItemsCartList extends GetView<CartControllerImpl> {
  final String name;
  final String price;
  final String count;
  final itemId;
  const CustomItemsCartList({
    super.key,
    required this.name,
    required this.price,
    required this.count,
    required this.itemId,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartControllerImpl>(
      builder: (controller) => Card(
        child: Container(
          child: Row(children: [
            Expanded(
                flex: 2,
                child: Image.asset(
                  AppImageAssets.logo,
                  height: 90,
                  fit: BoxFit.cover,
                )),
            Expanded(
                flex: 3,
                child: ListTile(
                  title: Text(name, style: TextStyle(fontSize: 15)),
                  subtitle: Text(price,
                      style: const TextStyle(
                          color: AppColors.primaryColor, fontSize: 17)),
                )),
            Expanded(
                child: Column(
              children: [
                Container(
                    height: 35,
                    child: IconButton(
                        onPressed: () => controller.addToCart(
                            itemId, controller.cartProductCount),
                        icon: Icon(Icons.add))),
                Container(
                    height: 30,
                    child: Text(
                      count,
                      style: TextStyle(fontFamily: "sans"),
                    )),
                Container(
                    height: 25,
                    child: IconButton(
                        onPressed: () => controller.removeFromCart(itemId),
                        icon: Icon(Icons.remove)))
              ],
            ))
          ]),
        ),
      ),
    );
  }
}
