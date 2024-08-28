import 'package:flutter/material.dart';
import 'package:zingoshop/page_transitions.dart';
import 'package:zingoshop/view/screen/orders/tracking.dart';
import 'package:zingoshop/core/middleware/app_middle_ware.dart';
import 'package:zingoshop/view/screen/address/add_address.dart';
import 'package:zingoshop/view/screen/address/add_address_details.dart';
import 'package:zingoshop/view/screen/address/address.dart';
import 'package:zingoshop/view/screen/cart.dart';
import 'package:zingoshop/view/screen/checkout.dart';
import 'package:zingoshop/view/screen/favorite_screen.dart';
import 'package:zingoshop/view/screen/home_screen.dart';
import 'package:zingoshop/view/screen/items.dart';
import 'package:zingoshop/view/screen/notification.dart';
import 'package:zingoshop/view/screen/offers.dart';
import 'package:zingoshop/view/screen/orders/archive.dart';
import 'package:zingoshop/view/screen/orders/details.dart';
import 'package:zingoshop/view/screen/orders/pending.dart';
import 'package:zingoshop/view/screen/product_details.dart';
import 'package:get/get.dart';

import 'package:zingoshop/core/constants/routes_name.dart';
import 'package:zingoshop/view/screen/screen_barrel.dart';

List<GetPage> getPages() {
  List<GetPage> getPages = [
    // ========================= Auth ========================= //
    GetPage(
      name: AppRoutes.language,
      page: () => const LanguageScreen(),
      middlewares: [AppMiddleWare()],
    ),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnBoardingScreen(),
      transitionDuration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      customTransition: CustomPageTransitionLeftAndRight(),
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
      transitionDuration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      customTransition: CustomPageTransitionLeftAndRight(),
    ),
    GetPage(
      name: AppRoutes.resetPassword,
      page: () => const ResetPasswordScreen(),
      transitionDuration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      customTransition: CustomPageTransitionLeftAndRight(),
    ),
    GetPage(
      name: AppRoutes.verifyCode,
      page: () => const VerifyCodeScreen(),
      transitionDuration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      customTransition: CustomPageTransitionLeftAndRight(),
    ),
    GetPage(
      name: AppRoutes.successSignUp,
      page: () => const SuccessSignUp(),
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: AppRoutes.successPasswordReset,
      page: () => const SuccessPasswordReset(),
    ),
    GetPage(
      name: AppRoutes.verifySignUpCode,
      page: () => const VerifySignUpCode(),
      transitionDuration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      customTransition: CustomPageTransitionLeftAndRight(),
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
    ),
    GetPage(
      name: AppRoutes.cart,
      page: () => const CartScreen(),
    ),
    GetPage(
      name: AppRoutes.address,
      page: () => const AddressScreen(),
    ),
    GetPage(
      name: AppRoutes.addAddress,
      page: () => const AddAddressScreen(),
    ),

    GetPage(
      name: AppRoutes.addAddressDetails,
      page: () => const AddAddressDetailsScreen(),
    ),

    GetPage(name: AppRoutes.checkout, page: () => const CheckoutScreen()),

    // ========================= Order ========================= //
    GetPage(
        name: AppRoutes.pendingOrders, page: () => const PendingOrdersScreen()),
    GetPage(
        name: AppRoutes.archiveOrders, page: () => const ArchiveOrdersScreen()),
    GetPage(
        name: AppRoutes.ordersDetails, page: () => const OrdersDetailsScreen()),
    GetPage(
        name: AppRoutes.orderTracking, page: () => const OrderTrackingScreen()),
    // ========================= Notification ========================= //
    GetPage(
        name: AppRoutes.notification, page: () => const NotificationScreen()),

    // ========================= Offers ========================= //
    GetPage(name: AppRoutes.offers, page: () => const OffersScreen()),
  ];
  return getPages;
}
