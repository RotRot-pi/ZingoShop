import 'package:zingoshop/core/constants/routes_name.dart';
import 'package:zingoshop/core/services/services.dart';
import 'package:zingoshop/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnboardingController extends GetxController {
  nextPage();
  skipOnboarding();
  onPageChanged(int pageIndex);
}

class OnboardingControllerImpl extends OnboardingController {
  int currentPage = 0;
  late PageController pageController;
  final AppServices _appServices = Get.find();
  @override
  nextPage() {
    currentPage++;
    if (currentPage > onboardingList.length - 1) {
      _appServices.sharedPreferences.setInt('step', 1);
      Get.offAllNamed(AppRoutes.login);
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    }
  }

  @override
  skipOnboarding() {
    _appServices.sharedPreferences.setInt('step', 1);
    Get.offAllNamed(AppRoutes.login);
  }

  @override
  onPageChanged(int pageIndex) {
    currentPage = pageIndex;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
