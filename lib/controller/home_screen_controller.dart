import 'package:ecommercecourse/view/screen/home_page.dart';
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
    Center(child: Text('Cart')),
    Center(child: Text('Account')),
    Center(child: Text('More')),
  ];
  List bottomAppBarItems = [
    {
      "icon": Icons.home,
      "name": "Home",
    },
    {
      "icon": Icons.shopping_cart,
      "name": "Cart",
    },
    {
      "icon": Icons.person,
      "name": "Account",
    },
    {
      "icon": Icons.more,
      "name": "More",
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
