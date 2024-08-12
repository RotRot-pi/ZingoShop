import 'package:ecommercecourse/core/constants/theme.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalizationController extends GetxController {
  late final Locale language;

  final AppServices appServices = Get.find();
  ThemeData appTheme = appEnglishTheme;
  changeLanguage(String languageCode) {
    Locale locale = Locale(languageCode);
    appServices.sharedPreferences.setString("lang", languageCode);
    appTheme = languageCode == 'ar' ? appArabicTheme : appEnglishTheme;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
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
