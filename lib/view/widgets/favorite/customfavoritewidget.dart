import 'dart:math' as math;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:zingoshop/controller/favorite_controller.dart';
import 'package:zingoshop/controller/favorite_items_controller.dart';
import 'package:zingoshop/core/constants/api_link.dart';
import 'package:zingoshop/core/constants/colors.dart';
import 'package:zingoshop/core/constants/image_assets.dart';
import 'package:zingoshop/core/constants/spaces.dart';
import 'package:zingoshop/core/functions/translate_data.dart';
import 'package:zingoshop/data/model/favorite.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFavoriteWidget extends GetView<FavoriteControllerImpl> {
  final Favorite favorite;
  const CustomFavoriteWidget({
    super.key,
    required this.favorite,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        // onTap: () => controller.goToProductDetails(item),
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
                  CachedNetworkImage(
                    imageUrl:
                        "${ApiLink.itemsImageFolder}/${favorite.itemsImage}",
                    height: h64,
                    fit: BoxFit.scaleDown,
                    fadeInDuration: const Duration(milliseconds: 400),
                    fadeOutDuration: const Duration(milliseconds: 400),
                  ),
                  AppSpacing.addHeigh(h4),
                  Text(translateData(favorite.itemsNameAr, favorite.itemsName),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: AppColors.black,
                          fontSize: s16,
                          fontWeight: FontWeight.w500)),

                  AppSpacing.addHeigh(h4),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     Text("${controller.deliveryTime}",
                  //         style: const TextStyle(fontSize: s16),
                  //         textAlign: TextAlign.center),
                  //     AppSpacing.addWidth(h4),
                  //     const Icon(
                  //       Icons.timer_sharp,
                  //       size: s16,
                  //     ),
                  //   ],
                  // ),
                  //Rating stars
                  //
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${"rating".tr} 3.5",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: AppColors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            fontFamily: "OpenSans",
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          height: h24,
                          child: Row(
                            children: [
                              ...List.generate(
                                  math.Random().nextInt(6),
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
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${favorite.itemsPrice.toStringAsFixed(2)} \$",
                          style: const TextStyle(
                              color: AppColors.black,
                              fontSize: s16,
                              fontWeight: FontWeight.w600,
                              fontFamily: "OpenSans")),
                      //      GetBuilder<FavoriteItemsControllerImpl>(
                      //     builder: (controller) {
                      //   return InkWell(
                      //     onTap: controller.changeFavorite(favorite),
                      //     child: controller.favoriteItems.contains(id)
                      //         ? const Icon(
                      //             Icons.favorite,
                      //             size: s24,
                      //             color: AppColors.primaryColor,
                      //           )
                      //         : const Icon(
                      //             Icons.favorite_border_outlined,
                      //             size: s24,
                      //           ),
                      //   );
                      // }),
                    ],
                  )
                ]),
          ),
          if (favorite.itemsDiscount != 0)
            //TODO: Make it directional (rtl,ltr)

            Positioned(
                child: ColorFiltered(
              colorFilter: ColorFilter.matrix(colorFilterMatrix),
              // colorFilter: ColorFilter.mode(
              //     AppColors.secondaryColor, BlendMode.colorBurn),
              child: Image.asset(
                AppImageAssets.sales,
                height: h48,
                width: w48,
                fit: BoxFit.cover,
              ),
            ))
        ],
      ),
    ));
  }

  final List<double> colorFilterMatrix = const <double>[
    0.5126,
    1.0,
    0.7722,
    0.125,
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
