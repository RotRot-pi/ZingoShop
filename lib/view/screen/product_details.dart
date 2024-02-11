import 'package:ecommercecourse/controller/product_details_controller.dart';
import 'package:ecommercecourse/core/constants/colors.dart';
import 'package:ecommercecourse/core/constants/spaces.dart';
import 'package:ecommercecourse/view/widgets/product_details/priceandcount.dart';
import 'package:ecommercecourse/view/widgets/product_details/subitemslist.dart';
import 'package:ecommercecourse/view/widgets/product_details/toppageproductdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImpl controller =
        Get.put(ProductDetailsControllerImpl());
    return Scaffold(
        bottomNavigationBar: Container(
            margin: AppSpacing.addEdgeInsetsSymmetric(
                vertical: m12, horizontal: m12),
            height: h40,
            child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(r12)),
                color: AppColors.secondaryColor,
                onPressed: () {},
                child: const Text(
                  "Add To Cart",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ))),
        body: ListView(children: [
          const TopProductPageDetails(),
          const SizedBox(
            height: 100,
          ),
          Container(
            padding: AppSpacing.addEdgeInsetsAll(p20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(controller.item.itemsName,
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        color: AppColors.fifthColor,
                      )),
              AppSpacing.addHeigh(h10),
              PriceAndCountItems(
                  onAdd: () {}, onRemove: () {}, price: "200.0", count: "2"),
              AppSpacing.addHeigh(h10),
              Text('''${controller.item.itemsDescription} 
                  ${controller.item.itemsDescription} ${controller.item.itemsDescription} 
                  ${controller.item.itemsDescription} ${controller.item.itemsDescription}''',
                  style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 10),
              Text("Color",
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        color: AppColors.fourthColor,
                      )),
              AppSpacing.addHeigh(h10),
              const SubitemsList()
            ]),
          )
        ]));
  }
}
