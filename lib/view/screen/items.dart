import 'package:ecommercecourse/controller/favorite_controller.dart';
import 'package:ecommercecourse/controller/items_controller.dart';
import 'package:ecommercecourse/core/constants/spaces.dart';
import 'package:ecommercecourse/data/model/items.dart';
import 'package:ecommercecourse/view/widgets/customappbar.dart';
import 'package:ecommercecourse/view/widgets/handeling_data_view.dart';
import 'package:ecommercecourse/view/widgets/items/customitemslist.dart';
import 'package:ecommercecourse/view/widgets/items/listitemscategories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ItemsControllerImpl());
    var favoriteController = Get.put(FavoriteControllerImpl());
    return Scaffold(
      body: Padding(
        padding: AppSpacing.addEdgeInsetsAll(p16),
        child: GetBuilder<ItemsControllerImpl>(builder: (controller) {
          return ListView(
            children: [
              CustomAppBar(
                titleappbar: "Find Your Product",
                onPressedIcon: null,
                onPressedSearch: null,
              ),
              AppSpacing.addHeigh(h16),
              ListItemsCategories(),
              HandelingDataView(
                requestStatus: controller.requestStatus,
                child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.items.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.65),
                    itemBuilder: (BuildContext context, index) {
                      favoriteController
                          .addItemToFavorite(controller.items[index]);
                      return CustomListItems(item: controller.items[index]);
                    }),
              )
            ],
          );
        }),
      ),
    );
  }
}
