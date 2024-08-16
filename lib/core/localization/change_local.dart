import 'package:zingoshop/core/constants/routes_name.dart';
import 'package:zingoshop/core/constants/theme.dart';
import 'package:zingoshop/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalizationController extends GetxController {
  late final Locale language;
  bool done = false;
  String selectedLanguage = '';
  final AppServices appServices = Get.find();
  ThemeData appTheme = appEnglishTheme;
  changeLanguage() {
    Locale locale = Locale(selectedLanguage);
    appServices.sharedPreferences.setString("lang", selectedLanguage);
    appTheme = selectedLanguage == 'ar' ? appArabicTheme : appEnglishTheme;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
    // update();
  }

  goToOnboarding() {
    Get.offNamed(AppRoutes.onboarding);
  }

  selectLanguge(String languageCode) {
    selectedLanguage = languageCode;
    done = true;
    update();
  }

  @override
  void onInit() {
    String? sharedPrefLangague =
        appServices.sharedPreferences.getString('lang');

    if (sharedPrefLangague == 'ar') {
      language = const Locale('ar');
      appTheme = appArabicTheme;
    } else if (sharedPrefLangague == 'en') {
      language = const Locale('en');
      appTheme = appEnglishTheme;
    } else {
      language = Locale(Get.deviceLocale?.languageCode ?? 'en');
    }
    super.onInit();
  }
}
