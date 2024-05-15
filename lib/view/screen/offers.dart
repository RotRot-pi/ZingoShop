//create offers screen
import 'package:ecommercecourse/controller/favorite_items_controller.dart';
import 'package:ecommercecourse/controller/offers_controller.dart';
import 'package:ecommercecourse/core/constants/routes_name.dart';
import 'package:ecommercecourse/data/model/items.dart';
import 'package:ecommercecourse/view/screen/home_page.dart';
import 'package:ecommercecourse/view/widgets/customappbar.dart';
import 'package:ecommercecourse/view/widgets/handeling_data_view.dart';
import 'package:ecommercecourse/view/widgets/home/customListOffers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OffersController());
    Get.put(FavoriteItemsControllerImpl());
    return GetBuilder<OffersController>(builder: (controller) {
      return Column(
        children: [
          CustomAppBar(
            titleappbar: "find_product".tr,
            searchController: controller.searchController,
            onPressedIcon: () {},
            onPressedFavorite: () => Get.toNamed(AppRoutes.favorite),
            onPressedSearch: () => controller.onItemsSearch(),
            onChanged: (value) => controller.isSearching(value),
          ),
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
      );
    });
  }
}
