import 'package:zingoshop/core/constants/image_assets.dart';
import 'package:get/get.dart';

import '../../model/onboarding.dart';

List<OnboardingModel> onboardingList = [
  OnboardingModel(
    title: 'choose_product'.tr,
    description: 'product_description'.tr,
    image: AppImageAssets.onboardingone,
  ),
  OnboardingModel(
      title: 'easy_and_safe_payment'.tr,
      description: 'payment_methods'.tr,
      image: AppImageAssets.onboardingTwo),
  OnboardingModel(
    title: 'order_tracking'.tr,
    description: 'order_tracking_description'.tr,
    image: AppImageAssets.onboardingThree,
  ),
];
