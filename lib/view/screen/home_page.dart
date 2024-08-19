import 'package:cached_network_image/cached_network_image.dart';
import 'package:zingoshop/controller/home_controller.dart';
import 'package:zingoshop/core/constants/api_link.dart';
import 'package:zingoshop/core/constants/colors.dart';
import 'package:zingoshop/core/constants/routes_name.dart';
import 'package:zingoshop/core/constants/spaces.dart';

import 'package:zingoshop/view/widgets/handeling_data_view.dart';
import 'package:zingoshop/view/widgets/customappbar.dart';
import 'package:zingoshop/view/widgets/home/customhomecard.dart';
import 'package:zingoshop/view/widgets/home/customtitlehome.dart';
import 'package:zingoshop/view/widgets/home/listcategorieshome.dart';
import 'package:zingoshop/view/widgets/home/listitemshome.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImpl());
    return GetBuilder<HomeControllerImpl>(
      builder: (controller) => Container(
          color: AppColors.white,
          padding: AppSpacing.addEdgeInsetsSymmetric(horizontal: p16),
          child: RefreshIndicator.adaptive(
            onRefresh: () => controller.getData(),
            backgroundColor: AppColors.white,
            color: AppColors.primaryColor,
            child: ListView(
              children: [
                CustomAppBar(
                  searchHintText: "what_are_you_looking_for".tr,
                  searchController: controller.searchController,
                  secondActionIcon: Icons.favorite_border_outlined,
                  secondActionOnPressed: () => Get.toNamed(AppRoutes.favorite),
                  goBack: false,
                  onPressedSearch: () => controller.onItemsSearch(),
                  onChanged: (value) => controller.isSearching(value),
                ),
                !controller.isSeaching
                    ? GetBuilder<HomeControllerImpl>(builder: (controller) {
                        return HandelingDataView(
                            requestStatus: controller.requestStatus,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (controller.homeCartSettings.isNotEmpty)
                                  CustomCardHome(
                                      title: controller.titleHomeCard,
                                      body: controller.descriptionHomeCard,
                                      language: controller.language),
                                const ListCategoriesHome(),
                                SizedBox(height: h24),
                                CustomTitleHome(title: "product_for_you".tr),
                                const ListItemsHome(),
                                SizedBox(height: h24),
                                CustomTitleHome(title: "offer".tr),
                                const ListItemsHome()
                              ],
                            ));
                      })
                    : SearchedItemsList(
                        listdatamodel: controller.searchedItems,
                      )
              ],
            ),
          )
          // : Column(
          //     children: [
          //       CustomAppBar(
          //           titleappbar: "find_product".tr,
          //           searchController: controller.searchController,
          //           onPressedIcon: () {},
          //           onPressedFavorite: () =>
          //               Get.toNamed(AppRoutes.favorite),
          //           onPressedSearch: () =>
          //               controller.searchItems()),
          //       Expanded(
          //           child: SearchedItemsList(
          //         listdatamodel: controller.searchedItems,
          //       )),
          //     ],
          //   ),
          ),
      // Add additional widgets here as per your requirements
    );
  }
}

class SearchedItemsList extends GetView<HomeControllerImpl> {
  final List listdatamodel;
  const SearchedItemsList({super.key, required this.listdatamodel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listdatamodel.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.goToProductDetails(listdatamodel[index]);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Card(
                  child: Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                        child: CachedNetworkImage(
                            imageUrl:
                                "${ApiLink.itemsImageFolder}/${listdatamodel[index].itemsImage}")),
                    Expanded(
                        flex: 2,
                        child: ListTile(
                          title: Text(listdatamodel[index].itemsName!),
                          subtitle:
                              Text(listdatamodel[index].itemsDescription!),
                        )),
                  ],
                ),
              )),
            ),
          );
        });
  }
}

// class CustomListCategory extends StatelessWidget {
//   const CustomListCategory({
//     super.key,
//     required this.controller,
//   });

//   final HomeControllerImpl controller;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: h100,
//       child: ListView.separated(
//         scrollDirection: Axis.horizontal,
//         separatorBuilder: (context, index) => AppSpacing.addWidth(w16),
//         itemCount: controller.categories.length,
//         itemBuilder: (context, index) {
//           print(
//               "Image name :${controller.categories[index]['categories_image']}");
//           return Container(
//             margin: EdgeInsets.only(right: p8),
//             child: Column(
//               children: [
//                 Container(
//                   width: w56,
//                   height: h56,
//                   padding: EdgeInsets.all(p8),
//                   decoration: BoxDecoration(
//                       color: Colors.grey[200],
//                       borderRadius: BorderRadius.circular(r12)),
//                   child: SvgPicture.network(
//                     "${ApiLink.categoriesImageFolder}${controller.categories[index]['categories_image']}",

//                     // colorFilter:
//                     //     ColorFilter.mode(AppColors.black, BlendMode.colorBurn),
//                   ),
//                 ),
//                 AppSpacing.addHeigh(h8),
//                 Text(controller.categories[index]['categories_name'],
//                     style: TextStyle(
//                         color: Colors.grey[600],
//                         fontSize: s12,
//                         fontWeight: FontWeight.bold)),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
