import 'package:ecommercecourse/core/middleware/app_middle_ware.dart';
import 'package:ecommercecourse/view/screen/favorite_screen.dart';
import 'package:ecommercecourse/view/screen/home_screen.dart';
import 'package:ecommercecourse/view/screen/items.dart';
import 'package:ecommercecourse/view/screen/product_details.dart';
import 'package:get/get.dart';

import 'package:ecommercecourse/core/constants/routes_name.dart';
import 'package:ecommercecourse/view/screen/screen_barrel.dart';

List<GetPage> getPages = [
  // GetPage(
  //   name: '/',
  //   page: () => Test(),
  // )

  // ========================= Auth ========================= //
  GetPage(
      name: AppRoutes.language,
      page: () => const LanguageScreen(),
      middlewares: [AppMiddleWare()]),
  GetPage(
    name: AppRoutes.onboarding,
    page: () => const OnBoardingScreen(),
  ),
  GetPage(
    name: AppRoutes.login,
    page: () => const LoginScreen(),
  ),
  GetPage(
    name: AppRoutes.signup,
    page: () => const SignUpScreen(),
  ),
  GetPage(
    name: AppRoutes.forgetPassword,
    page: () => const CheckEmailScreen(),
  ),
  GetPage(
    name: AppRoutes.resetPassword,
    page: () => const ResetPasswordScreen(),
  ),
  GetPage(
    name: AppRoutes.verifyCode,
    page: () => const VerifyCodeScreen(),
  ),
  GetPage(
    name: AppRoutes.successSignUp,
    page: () => const SuccessSignUp(),
  ),
  GetPage(
    name: AppRoutes.successPasswordReset,
    page: () => const SuccessPasswordReset(),
  ),
  GetPage(
    name: AppRoutes.verifySignUpCode,
    page: () => const VerifySignUpCode(),
  ),

  // ========================= Home ========================= //
  GetPage(
    name: AppRoutes.home,
    page: () => const HomeScreen(),
  ),

  GetPage(
    name: AppRoutes.items,
    page: () => const ItemsScreen(),
  ),

  GetPage(
    name: AppRoutes.productDetails,
    page: () => const ProductDetailsScreen(),
  ),
  GetPage(
    name: AppRoutes.favorite,
    page: () => const FavoriteScreen(),
  )
];
