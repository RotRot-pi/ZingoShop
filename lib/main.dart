import 'package:ecommercecourse/bindings/init_binding.dart';
import 'package:ecommercecourse/core/localization/change_local.dart';
import 'package:ecommercecourse/core/localization/translation.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await ScreenUtil.ensureScreenSize();
  await initializeServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;
    LocalizationController localizationController = Get.put(
      LocalizationController(),
    );
    return ScreenUtilInit(
      designSize: Size(width, height),
      // minTextAdapt: true,
      builder: (context, widget) {
        // ScreenUtil.init(
        //   context,
        //   minTextAdapt: true,
        // );
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          translations: AppTranslation(),
          locale: localizationController.language,
          theme: localizationController.appTheme,
          getPages: getPages,
          initialBinding: InitialAppBindings(),
        );
      },
    );
  }
}
