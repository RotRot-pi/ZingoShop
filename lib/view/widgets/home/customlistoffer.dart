import 'package:cached_network_image/cached_network_image.dart';
import 'package:zingoshop/controller/favorite_items_controller.dart';
import 'package:zingoshop/controller/offers_controller.dart';
import 'package:zingoshop/core/constants/api_link.dart';
import 'package:zingoshop/core/constants/colors.dart';
import 'package:zingoshop/core/constants/image_assets.dart';
import 'package:zingoshop/core/constants/spaces.dart';
import 'package:zingoshop/core/functions/translate_data.dart';

import 'package:zingoshop/data/model/items.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListOffers extends GetView<OffersController> {
  final Item item;
  const CustomListOffers({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => controller.goToProductDetails(item),
        child: SizedBox(
          height: h200,
          child: Card(
            color: AppColors.white,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(r20),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: AppSpacing.addEdgeInsetsAll(p12),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Hero(
                          tag: "${item.itemsId}",
                          child: CachedNetworkImage(
                            imageUrl:
                                "${ApiLink.itemsImageFolder}/${item.itemsImage}",
                            height: h56,
                            fit: BoxFit.scaleDown,
                            fadeInDuration: const Duration(milliseconds: 400),
                            fadeOutDuration: const Duration(milliseconds: 400),
                          ),
                        ),
                        AppSpacing.addHeigh(h10),
                        Text(translateData(item.itemsNameAr, item.itemsName),
                            style: const TextStyle(
                                color: AppColors.black,
                                fontSize: s16,
                                fontWeight: FontWeight.bold)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${"rating".tr} 3.5",
                                textAlign: TextAlign.center),
                            Container(
                              alignment: Alignment.bottomCenter,
                              height: h24,
                              child: Row(
                                children: [
                                  ...List.generate(
                                      5,
                                      (index) => const Icon(
                                            Icons.star_outlined,
                                            size: s16,
                                            color: AppColors.sixthColor,
                                          ))
                                ],
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                    "${item.itemsPriceAfterDiscount?.toStringAsFixed(2)} \$",
                                    style: const TextStyle(
                                        color: AppColors.primaryColor,
                                        fontSize: s16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "OpenSans")),
                                AppSpacing.addWidth(h8),
                                if (item.itemsDiscount != 0)
                                  Text(
                                    '\$${item.itemsPrice.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.grey,
                                    ),
                                  ),
                              ],
                            ),
                            GetBuilder<FavoriteItemsControllerImpl>(
                                builder: (controller) {
                              return IconButton(
                                onPressed: () {
                                  controller.changeFavorite(item);
                                },
                                icon: controller.favoriteItems
                                        .contains(item.itemsId)
                                    ? const Icon(
                                        Icons.favorite,
                                        color: AppColors.primaryColor,
                                      )
                                    : const Icon(
                                        Icons.favorite_border_outlined),
                              );
                            })
                          ],
                        ),
                      ]),
                ),
                if (item.itemsDiscount != 0)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '${item.itemsDiscount}% OFF',
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ));
  }

  final List<double> colorFilterMatrix = const <double>[
    0.5126,
    1.0,
    0.7722,
    0,
    1,
    0.2126,
    1.2152,
    0.0722,
    0,
    0,
    0.2126,
    0.7152,
    0.0722,
    0,
    1,
    1,
    1,
    0,
    1,
    0
  ];
}
