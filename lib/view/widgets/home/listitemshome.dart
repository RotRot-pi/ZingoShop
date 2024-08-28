import 'package:zingoshop/controller/favorite_items_controller.dart';
import 'package:zingoshop/controller/home_controller.dart';
import 'package:zingoshop/core/constants/api_link.dart';
import 'package:zingoshop/core/constants/colors.dart';
import 'package:zingoshop/core/constants/spaces.dart';
import 'package:zingoshop/core/functions/translate_data.dart';
import 'package:zingoshop/data/model/items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListItemsHome extends GetView<HomeControllerImpl> {
  const ListItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    FavoriteItemsControllerImpl favoriteItemsControllerImpl =
        Get.put(FavoriteItemsControllerImpl());
    return SizedBox(
      height: h220,
      child: ListView.builder(
          itemCount: controller.items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            Item item = controller.items[i];
            return Stack(
              children: [
                ProductCard(
                  id: item.itemsId,
                  press: () => controller.goToProductDetails(item),
                  bgColor: AppColors.whiteTextColor,
                  changeFavorite: () =>
                      favoriteItemsControllerImpl.changeFavorite(item),
                  price: item.itemsPrice,
                  title: item.itemsName,
                  image: "${ApiLink.itemsImageFolder}${item.itemsImage}",
                ),
                if (item.itemsDiscount != 0)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 2),
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
              ],
            );
          }),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.press,
    required this.bgColor,
    required this.changeFavorite,
    required this.id,
  });
  final String image, title;
  final Function()? press;
  final double price;
  final Color bgColor;
  final Function() changeFavorite;
  final int id;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: w140,
        padding: EdgeInsets.all(p16 / 2),
        margin: EdgeInsets.only(right: p16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(r16)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: h96,
              decoration: BoxDecoration(
                color: AppColors.grey.withAlpha(25),
                borderRadius: BorderRadius.all(Radius.circular(r16)),
              ),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Image.network(
                  image,
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
              textAlign: TextAlign.start,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: s14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black),
            ),
            const Spacer(),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${price.toStringAsFixed(2)}",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: s16,
                        color: AppColors.thirdColor),
                  ),
                  GetBuilder<FavoriteItemsControllerImpl>(
                      builder: (controller) {
                    return InkWell(
                      onTap: changeFavorite,
                      child: controller.favoriteItems.contains(id)
                          ? const Icon(
                              Icons.favorite,
                              size: s24,
                              color: AppColors.primaryColor,
                            )
                          : const Icon(
                              Icons.favorite_border_outlined,
                              size: s24,
                            ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
