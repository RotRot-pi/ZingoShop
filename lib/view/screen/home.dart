import 'package:ecommercecourse/controller/home_controller.dart';

import 'package:ecommercecourse/view/widgets/handeling_data_view.dart';
import 'package:ecommercecourse/view/widgets/home/customappbar.dart';
import 'package:ecommercecourse/view/widgets/home/customcardhome.dart';
import 'package:ecommercecourse/view/widgets/home/customtitlehome.dart';
import 'package:ecommercecourse/view/widgets/home/listcategorieshome.dart';
import 'package:ecommercecourse/view/widgets/home/listitemshome.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImpl());
    return Scaffold(
      body: GetBuilder<HomeControllerImpl>(
          builder: (controller) => HandelingDataView(
              requestStatus: controller.requestStatus,
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ListView(
                    children: [
                      CustomAppBar(
                          titleappbar: "Find Product",
                          onPressedIcon: () {},
                          onPressedSearch: () {}),
                      const CustomCardHome(
                          title: "A summer surprise", body: "Cashback 20%"),
                      const ListCategoriesHome(),
                      const SizedBox(height: 10),
                      const CustomTitleHome(title: "Product for you"),
                      const SizedBox(height: 10),
                      const ListItemsHome(),
                      const CustomTitleHome(title: "Offer"),
                      const SizedBox(height: 10),
                      const ListItemsHome()
                    ],
                  )))),
      // Add additional widgets here as per your requirements
    );
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
