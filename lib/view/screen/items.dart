import 'package:zingoshop/controller/items_controller.dart';
import 'package:zingoshop/core/constants/colors.dart';
import 'package:zingoshop/core/constants/routes_name.dart';
import 'package:zingoshop/core/constants/spaces.dart';
import 'package:zingoshop/view/screen/home_page.dart';
import 'package:zingoshop/view/widgets/customappbar.dart';
import 'package:zingoshop/view/widgets/handeling_data_view.dart';
import 'package:zingoshop/view/widgets/items/customitemslist.dart';
import 'package:zingoshop/view/widgets/items/listitemscategories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ItemsControllerImpl());
    return Scaffold(
        appBar: AppBar(
          title: Text('products'.tr,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: AppColors.white)),
        ),
        body: Column(
          children: [
            Padding(
              padding:
                  AppSpacing.addEdgeInsetsOnly(left: p16, right: p16, top: p24),
              child: CustomAppBar(
                searchHintText: "find_product".tr,
                searchController: controller.searchController,
                fistActionIcon: Icons.favorite_border_outlined,
                fistActionOnPressed: () => Get.toNamed(AppRoutes.favorite),
                secondActionIcon: Icons.shopping_cart,
                secondActionOnPressed: () => Get.toNamed(AppRoutes.cart),
                onPressedSearch: () => controller.onItemsSearch(),
                onChanged: (value) => controller.isSearching(value),
              ),
            ),
            AppSpacing.addHeigh(h16),
            const ListItemsCategories(),
            Expanded(
              child: GetBuilder<ItemsControllerImpl>(builder: (controller) {
                return Padding(
                  padding: AppSpacing.addEdgeInsetsOnly(left: p16, right: p16),
                  child: HandelingDataView(
                    requestStatus: controller.requestStatus,
                    child: !controller.isSeaching
                        ? GridView.builder(
                            itemCount: controller.items.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: p12,
                              crossAxisSpacing: p12,
                              crossAxisCount: 2,
                              childAspectRatio: 1 / 1.4,
                            ),
                            itemBuilder: (BuildContext context, index) {
                              return EnhancedProductCard(
                                item: controller.items[index],
                                onTap: () => controller.goToProductDetails(
                                    controller.items[index]),
                              );
                            })
                        : Expanded(
                            child: SearchedItemsList(
                              listdatamodel: controller.searchedItems,
                            ),
                          ),
                  ),
                );
              }),
            )
          ],
        ));
  }
}
