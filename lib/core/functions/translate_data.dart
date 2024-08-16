import 'package:zingoshop/core/services/services.dart';
import 'package:get/get.dart';

translateData(dataAr, dataEn) {
  AppServices appServices = Get.find();
  if (appServices.sharedPreferences.getString("lang") == 'ar') {
    return dataAr;
  } else {
    return dataEn;
  }
}
