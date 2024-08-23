import 'dart:math' as math;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:zingoshop/controller/favorite_items_controller.dart';
import 'package:zingoshop/core/constants/api_link.dart';
import 'package:zingoshop/core/constants/colors.dart';
import 'package:zingoshop/core/constants/spaces.dart';
import 'package:zingoshop/core/functions/translate_data.dart';

import 'package:zingoshop/data/model/items.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class EnhancedProductCard extends StatelessWidget {
  final Item item;
  final VoidCallback onTap;
  // final VoidCallback onFavoriteTap;
  // final bool isFavorite;

  const EnhancedProductCard({
    super.key,
    required this.item,
    required this.onTap,
    // required this.onFavoriteTap,
    // required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      height: h240,
      child: Card(
        color: AppColors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    padding: AppSpacing.addEdgeInsetsAll(p12),
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(16)),
                    ),
                    child: CachedNetworkImage(
                      imageUrl:
                          "${ApiLink.itemsImageFolder}/${item.itemsImage}",
                      height: h80,
                      width: double.infinity,
                      fit: BoxFit.scaleDown,
                      placeholder: (context, url) =>
                          const ShimmerLoading(height: 150),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  if (item.itemsDiscount != 0)
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '${item.itemsDiscount}% OFF',
                          style: const TextStyle(
                              fontSize: s10,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: FavoriteButton(
                      // isFavorite: isFavorite,
                      item: item,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      translateData(item.itemsNameAr, item.itemsName),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Row(
                      children: [
                        Icon(Icons.timer, size: 16, color: Colors.grey),
                        SizedBox(width: 4),
                        Text(
                          '${10} min',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    const Row(
                      children: [
                        RatingStars(rating: 3.5),
                        SizedBox(width: 4),
                        Text(
                          '(${3.5})',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${item.itemsPriceAfterDiscount?.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          ),
                        ),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  final Item item;

  const FavoriteButton({super.key, required this.item});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  late FavoriteItemsControllerImpl controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<FavoriteItemsControllerImpl>();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoriteItemsControllerImpl>(builder: (controller) {
      final isFavorite = controller.favoriteItems.contains(widget.item.itemsId);
      return GestureDetector(
        onTap: () {
          controller.changeFavorite(widget.item);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: isFavorite ? Colors.red : Colors.white,
            shape: BoxShape.circle,
          ),
          child: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.white : Colors.red,
            size: 20,
          ),
        ),
      );
    });
  }
}

class RatingStars extends StatelessWidget {
  final double rating;

  const RatingStars({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (index < rating.floor()) {
          return const Icon(Icons.star, size: 16, color: Colors.amber);
        } else if (index < rating.ceil()) {
          return const Icon(Icons.star_half, size: 16, color: Colors.amber);
        } else {
          return const Icon(Icons.star_border, size: 16, color: Colors.amber);
        }
      }),
    );
  }
}

class ShimmerLoading extends StatelessWidget {
  final double height;

  const ShimmerLoading({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: height,
        color: Colors.white,
      ),
    );
  }
}

// class CustomListItems extends GetView<ItemsControllerImpl> {
//   final Item item;
//   const CustomListItems({super.key, required this.item});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//         onTap: () => controller.goToProductDetails(item),
//         child: Card(
//           color: AppColors.white,
//           elevation: 5,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(r20),
//           ),
//           child: Stack(
//             children: [
//               Padding(
//                 padding: AppSpacing.addEdgeInsetsAll(p12),
//                 child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       CachedNetworkImage(
//                         imageUrl:
//                             "${ApiLink.itemsImageFolder}/${item.itemsImage}",
//                         height: h64,
//                         fit: BoxFit.scaleDown,
//                         fadeInDuration: const Duration(milliseconds: 400),
//                         fadeOutDuration: const Duration(milliseconds: 400),
//                       ),
//                       AppSpacing.addHeigh(h4),
//                       Text(translateData(item.itemsNameAr, item.itemsName),
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           style: const TextStyle(
//                               color: AppColors.black,
//                               fontSize: s16,
//                               fontWeight: FontWeight.w500)),

//                       AppSpacing.addHeigh(h4),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Text("${controller.deliveryTime}",
//                               style: const TextStyle(fontSize: s16),
//                               textAlign: TextAlign.center),
//                           AppSpacing.addWidth(h4),
//                           const Icon(
//                             Icons.timer_sharp,
//                             size: s16,
//                           ),
//                         ],
//                       ),
//                       //Rating stars
//                       //
//                       Expanded(
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               "${"rating".tr} 3.5",
//                               textAlign: TextAlign.center,
//                               style: const TextStyle(
//                                 color: AppColors.black,
//                                 fontSize: 10,
//                                 fontWeight: FontWeight.w500,
//                                 fontFamily: "OpenSans",
//                               ),
//                             ),
//                             Container(
//                               alignment: Alignment.bottomCenter,
//                               height: h24,
//                               child: Row(
//                                 children: [
//                                   ...List.generate(
//                                       math.Random().nextInt(6),
//                                       (index) => const Icon(
//                                             Icons.star_outlined,
//                                             size: s16,
//                                             color: AppColors.sixthColor,
//                                           ))
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                               "${item.itemsPriceAfterDiscount?.toStringAsFixed(2)} \$",
//                               style: const TextStyle(
//                                   color: AppColors.black,
//                                   fontSize: s16,
//                                   fontWeight: FontWeight.w600,
//                                   fontFamily: "OpenSans")),
//                           GetBuilder<FavoriteItemsControllerImpl>(
//                               builder: (controller) {
//                             return IconButton(
//                               onPressed: () {
//                                 controller.changeFavorite(item);
//                               },
//                               icon: controller.favoriteItems
//                                       .contains(item.itemsId)
//                                   ? const Icon(
//                                       Icons.favorite,
//                                       color: AppColors.primaryColor,
//                                     )
//                                   : const Icon(Icons.favorite_border_outlined),
//                             );
//                           })
//                         ],
//                       )
//                     ]),
//               ),
//               if (item.itemsDiscount != 0)
//                 //TODO: Make it directional (rtl,ltr)

//                 Positioned(
//                     child: ColorFiltered(
//                   colorFilter: ColorFilter.matrix(colorFilterMatrix),
//                   // colorFilter: ColorFilter.mode(
//                   //     AppColors.secondaryColor, BlendMode.colorBurn),
//                   child: Image.asset(
//                     AppImageAssets.sales,
//                     height: h48,
//                     width: w48,
//                     fit: BoxFit.cover,
//                   ),
//                 ))
//             ],
//           ),
//         ));
//   }

//   final List<double> colorFilterMatrix = const <double>[
//     0.5126,
//     1.0,
//     0.7722,
//     0.125,
//     1,
//     0.2126,
//     1.2152,
//     0.0722,
//     0,
//     0,
//     0.2126,
//     0.7152,
//     0.0722,
//     0,
//     1,
//     1,
//     1,
//     0,
//     1,
//     0
//   ];
// }
