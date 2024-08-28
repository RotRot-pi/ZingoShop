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

  const EnhancedProductCard({
    super.key,
    required this.item,
    required this.onTap,
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
