import 'package:ecommercecourse/controller/home_screen_controller.dart';
import 'package:ecommercecourse/view/widgets/home/cutombottomnavigationbar.dart';
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
        bottomNavigationBar: const CustomNavigationAppBar(),
        body: controller.pages[controller.currentPageIndex],
      );
    });
  }
}
