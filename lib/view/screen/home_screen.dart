import 'package:ecommercecourse/controller/home_screen_controller.dart';
import 'package:ecommercecourse/view/widgets/home/cutombottomnavigationbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: Test this widget with and without ScreenUtil
    //TODO: Test Text size with and without sp
    //TODO: Test Text with and without FittedBox widget
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
