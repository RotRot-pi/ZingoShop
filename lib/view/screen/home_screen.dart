import 'dart:io';

import 'package:zingoshop/controller/home_screen_controller.dart';
import 'package:zingoshop/view/animation/page_transition_switcher_wrapper.dart';
import 'package:zingoshop/view/widgets/home/cutombottomnavigationbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeScreenControllerImpl controller = Get.put(HomeScreenControllerImpl());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.goToCart(),
        shape: const CircleBorder(),
        backgroundColor: AppColors.secondaryColor,
        child: const Icon(Icons.shopping_basket_outlined, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomNavigationAppBar(),
      body: GetBuilder<HomeScreenControllerImpl>(builder: (controller) {
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) async {
            if (didPop) {
              return;
            }
            final bool shouldPop =
                await controller.showBackDialog(context) ?? false;
            if (shouldPop) {
              exit(0);
            }
          },
          child: PageTransitionSwitcherWrapper(
              child: controller.pages[controller.currentPageIndex]),
        );
      }),
    );
  }
}
