import 'package:ecommercecourse/view/screen/home_page.dart';
import 'package:ecommercecourse/view/screen/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int index);
  isPageActive(int index);
}

class HomeScreenControllerImpl extends HomeScreenController {
  int currentPageIndex = 0;

  List pages = [
    HomePage(),
    Center(child: Text('cart'.tr)),
    Center(child: Text('profile'.tr)),
    SettingsScreen()
  ];
  List bottomAppBarItems = [
    {
      "icon": Icons.home,
      "name": "home".tr,
    },
    {
      "icon": Icons.shopping_cart,
      "name": "cart".tr,
    },
    {
      "icon": Icons.person,
      "name": "profile".tr,
    },
    {
      "icon": Icons.more,
      "name": "settings".tr,
    }
  ];
  @override
  changePage(int index) {
    currentPageIndex = index;
    update();
  }

  @override
  isPageActive(int index) {
    return currentPageIndex == index;
  }
}
