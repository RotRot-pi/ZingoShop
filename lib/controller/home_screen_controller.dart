import 'package:ecommercecourse/core/constants/routes_name.dart';
import 'package:ecommercecourse/view/screen/cart.dart';
import 'package:ecommercecourse/view/screen/home_page.dart';
import 'package:ecommercecourse/view/screen/notification.dart';
import 'package:ecommercecourse/view/screen/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int index);
  isPageActive(int index);
}

class HomeScreenControllerImpl extends HomeScreenController {
  int currentPageIndex = 0;
  int? pageIndex;
  List pages = [
    HomePage(),
    Center(
      child: Text('Profile'),
    ),
    NotificationScreen(),
    SettingsScreen()
  ];
  List bottomAppBarItems = [
    {
      "icon": Icons.home,
      "name": "home".tr,
    },
    {
      "icon": Icons.person,
      "name": "profile".tr,
    },
    {
      "icon": Icons.notifications,
      "name": "notifications".tr,
    },
    {
      "icon": Icons.settings,
      "name": "settings".tr,
    }
  ];
  @override
  changePage(int index) {
    currentPageIndex = index;
    update();
  }

  goToCart() {
    Get.toNamed(AppRoutes.cart);
  }

  @override
  isPageActive(int index) {
    return currentPageIndex == index;
  }
}
