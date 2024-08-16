import 'package:zingoshop/bindings/init_binding.dart';
import 'package:zingoshop/core/localization/change_local.dart';
import 'package:zingoshop/core/localization/translation.dart';
import 'package:zingoshop/core/services/services.dart';
import 'package:zingoshop/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  // var s = await SharedPreferences.getInstance();
  // s.clear();
  await initializeServices();
  runApp(const MyApp());
}

//
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;
    screenInit(context, width, height);
    LocalizationController localizationController = Get.put(
      LocalizationController(),
    );
    return ScreenUtilInit(
      designSize: Size(width, height),

      // minTextAdapt: true,
      builder: (context, widget) {
        return Directionality(
          textDirection: Get.locale == const Locale('ar')
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Zingo Shop',
            translations: AppTranslation(),
            locale: localizationController.language,
            theme: localizationController.appTheme,
            getPages: getPages(),
            initialBinding: InitialAppBindings(),
          ),
        );
      },
    );
  }
}

screenInit(var context, var width, var height) {
  ScreenUtil.init(
    context,
    designSize: Size(width, height),
    minTextAdapt: true,
  );
}
