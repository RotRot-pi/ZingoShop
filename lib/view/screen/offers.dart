//create offers screen
import 'package:zingoshop/controller/favorite_items_controller.dart';
import 'package:zingoshop/controller/offers_controller.dart';
import 'package:zingoshop/core/constants/colors.dart';
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
        child: Container(
          color: AppColors.white,
          padding: AppSpacing.addEdgeInsetsSymmetric(horizontal: p16),
          child: Column(
            children: [
              CustomAppBar(
                searchHintText: "what_are_you_looking_for".tr,
                searchController: controller.searchController,
                fistActionIcon: Icons.notifications_outlined,
                fistActionOnPressed: () => Get.toNamed(AppRoutes.favorite),
                secondActionIcon: Icons.favorite_border_outlined,
                secondActionOnPressed: () => Get.toNamed(AppRoutes.favorite),
                onPressedSearch: () => controller.onItemsSearch(),
                onChanged: (value) => controller.isSearching(value),
              ),
              AppSpacing.addHeigh(h24),
              !controller.isSeaching
                  ? GetBuilder<OffersController>(builder: (controller) {
                      return HandelingDataView(
                        requestStatus: controller.requestStatus,
                        child: Expanded(
                          child: ListView.separated(
                              itemCount: controller.data.length,
                              itemBuilder: (context, index) {
                                Item item = controller.data[index];
                                return CustomListOffers(item: item);
                              },
                              separatorBuilder: (context, index) =>
                                  AppSpacing.addHeigh(h24)),
                        ),
                      );
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
