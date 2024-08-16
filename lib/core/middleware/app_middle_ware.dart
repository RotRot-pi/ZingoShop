import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:zingoshop/core/constants/routes_name.dart';
import 'package:zingoshop/core/services/services.dart';

class AppMiddleWare extends GetMiddleware {
  final AppServices _appServices = Get.find();
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (_appServices.sharedPreferences.getInt('step') == 2) {
      return const RouteSettings(name: AppRoutes.home);
    }
    if (_appServices.sharedPreferences.getInt('step') == 1) {
      return const RouteSettings(name: AppRoutes.login);
    }
    return null;
  }
}
