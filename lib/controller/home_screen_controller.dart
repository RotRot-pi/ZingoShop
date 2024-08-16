import 'package:zingoshop/core/constants/colors.dart';
import 'package:zingoshop/core/constants/routes_name.dart';
import 'package:zingoshop/view/screen/home_page.dart';
import 'package:zingoshop/view/screen/notification.dart';
import 'package:zingoshop/view/screen/offers.dart';
import 'package:zingoshop/view/screen/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int index);
  isPageActive(int index);
  showBackDialog(BuildContext context);
}

class HomeScreenControllerImpl extends HomeScreenController {
  int currentPageIndex = 0;
  int? pageIndex;
  List pages = [
    const HomePage(),
    const OffersScreen(),
    const NotificationScreen(),
    const SettingsScreen()
  ];
  List bottomAppBarItems = [
    {
      "icon": Icons.home,
      "name": "home".tr,
    },
    {
      "icon": Icons.local_offer_outlined,
      "name": "offers".tr,
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
  Future<bool?> showBackDialog(BuildContext context) {
    return Get.defaultDialog(
      backgroundColor: AppColors.whiteTextColor,
      cancelTextColor: Colors.blue,
      title: 'Are you sure?',
      content: const Text(
        'Are you sure you want to leave the app?',
      ),
      actions: <Widget>[
        OutlinedButton(
          style: OutlinedButton.styleFrom(
              side: const BorderSide(
            color: AppColors.secondaryColor,
          )),
          child: Text(
            'cancel',
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(color: AppColors.primaryColor),
          ),
          onPressed: () {
            Get.back(result: false);
          },
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
              side: const BorderSide(
            color: AppColors.secondaryColor,
          )),
          child: Text(
            'Leave',
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(color: AppColors.primaryColor),
          ),
          onPressed: () {
            Get.back(result: true);
          },
        ),
      ],
    );
  }

  @override
  isPageActive(int index) {
    return currentPageIndex == index;
  }
}
