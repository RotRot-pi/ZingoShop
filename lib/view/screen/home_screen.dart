import 'package:ecommercecourse/controller/home_screen_controller.dart';
import 'package:ecommercecourse/core/constants/spaces.dart';
import 'package:ecommercecourse/view/widgets/home/cutombottomappbarbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImpl());
    return GetBuilder<HomeScreenControllerImpl>(builder: (controller) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          shape: const CircleBorder(),
          child: const Icon(Icons.shopping_basket_outlined),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: m12,
          child: Row(
            children: [
              Row(
                children: [
                  CustomBottomAppBarButton(
                    onPressed: () => controller.changePage(0),
                    name: "Home",
                    icon: Icons.home,
                    isActive: controller.currentPageIndex == 0,
                  ),
                  CustomBottomAppBarButton(
                    onPressed: () => controller.changePage(1),
                    name: "Cart",
                    icon: Icons.shopping_cart,
                    isActive: controller.isPageActive(1),
                  ),
                ],
              ),
              // AppSpacing.addSpace(),
              Row(
                children: [
                  CustomBottomAppBarButton(
                    onPressed: () => controller.changePage(2),
                    name: "Account",
                    icon: Icons.person,
                    isActive: controller.isPageActive(2),
                  ),
                  CustomBottomAppBarButton(
                    onPressed: () => controller.changePage(3),
                    name: "More",
                    icon: Icons.more_horiz,
                    isActive: controller.isPageActive(3),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: controller.pages[controller.currentPageIndex],
      );
    });
  }
}
