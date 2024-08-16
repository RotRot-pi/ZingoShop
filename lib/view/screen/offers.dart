//create offers screen
import 'package:zingoshop/controller/favorite_items_controller.dart';
import 'package:zingoshop/controller/offers_controller.dart';
import 'package:zingoshop/core/constants/routes_name.dart';
import 'package:zingoshop/core/constants/spaces.dart';
import 'package:zingoshop/data/model/items.dart';
import 'package:zingoshop/view/screen/home_page.dart';
import 'package:zingoshop/view/widgets/customappbar.dart';
import 'package:zingoshop/view/widgets/handeling_data_view.dart';
import 'package:zingoshop/view/widgets/home/customlistoffer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OffersController());
    Get.put(FavoriteItemsControllerImpl());
    return GetBuilder<OffersController>(builder: (controller) {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              AppSpacing.addHeigh(h24),
              CustomAppBar(
                searchHintText: "find_product".tr,
                searchController: controller.searchController,
                onPressedIcon: () {},
                onPressedFavorite: () => Get.toNamed(AppRoutes.favorite),
                onPressedSearch: () => controller.onItemsSearch(),
                onChanged: (value) => controller.isSearching(value),
              ),
              AppSpacing.addHeigh(h24),
              !controller.isSeaching
                  ? GetBuilder<OffersController>(builder: (controller) {
                      return HandelingDataView(
                          requestStatus: controller.requestStatus,
                          child: Expanded(
                            child: ListView.builder(
                                itemCount: controller.data.length,
                                itemBuilder: (context, index) {
                                  Item item = controller.data[index];
                                  return CustomListOffers(item: item);
                                }),
                          ));
                    })
                  : SearchedItemsList(
                      listdatamodel: controller.searchedItems,
                    )
            ],
          ),
        ),
      );
    });
  }
}
