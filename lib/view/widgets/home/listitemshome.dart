import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:ecommercecourse/core/constants/api_link.dart';
import 'package:ecommercecourse/core/constants/colors.dart';
import 'package:ecommercecourse/core/constants/spaces.dart';
import 'package:ecommercecourse/core/functions/translate_data.dart';
import 'package:ecommercecourse/data/model/items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListItemsHome extends GetView<HomeControllerImpl> {
  const ListItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h196,
      child: ListView.builder(
          itemCount: controller.items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            return ProductCard(
              bgColor: AppColors.whiteTextColor,
              price: controller.items[i].itemsPrice,
              title: controller.items[i].itemsName,
              image:
                  "${ApiLink.itemsImageFolder}${controller.items[i].itemsImage}",
              // press: controller.goToProductDetails(controller.items[i]),
            );
          }),
    );
  }
}

// class ItemsHomeWidget extends StatelessWidget {
//   final Item item;
//   const ItemsHomeWidget(
//       {super.key, required this.item, required this.controller});
//   final HomeControllerImpl controller;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => controller.goToProductDetails(item),
//       child: Stack(
//         children: [
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//             margin: const EdgeInsets.symmetric(horizontal: 10),
//             child: Image.network(
//               "${ApiLink.itemsImageFolder}${item.itemsImage}",
//               height: 100,
//               width: 150,
//               fit: BoxFit.scaleDown,
//             ),
//           ),
//           Container(
//             decoration: BoxDecoration(
//                 color: AppColors.black.withOpacity(0.3),
//                 borderRadius: BorderRadius.circular(20)),
//             height: 120,
//             width: 200,
//           ),
//           Positioned(
//               left: 10,
//               bottom: 30,
//               child: Text(
//                 translateData(item.itemsNameAr, item.itemsName),
//                 style: const TextStyle(
//                     color: Colors.white,
//                     // fontWeight: FontWeight.bold,
//                     fontSize: 14),
//               ))
//         ],
//       ),
//     );
//   }
// }

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    // required this.press,
    required this.bgColor,
  });
  final String image, title;
  // final Function()? press;
  final double price;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: press,
      child: Container(
        width: w140,
        padding: EdgeInsets.all(p16 / 2),
        margin: EdgeInsets.only(right: p16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(r16)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              height: h96,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.all(Radius.circular(r16)),
              ),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Image.network(
                  image,
                  // height: 100,
                  width: 150,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            SizedBox(height: p16 / 2),
            const Divider(
              indent: s12,
              endIndent: s12,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: p16 / 4),
            Text(
              "\$${price.toStringAsFixed(2)}",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold, color: AppColors.black),
            ),
          ],
        ),
      ),
    );
  }
}
