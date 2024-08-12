import 'package:ecommercecourse/controller/onboarding_controller.dart';
import 'package:ecommercecourse/core/constants/colors.dart';
import 'package:ecommercecourse/core/constants/spaces.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomOnboardingButton extends GetView<OnboardingControllerImpl> {
  const CustomOnboardingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        controller.nextPage();
      },
      color: AppColors.primaryColor,
      textColor: AppColors.whiteTextColor,
      padding:
          AppSpacing.addEdgeInsetsSymmetric(horizontal: w100, vertical: zero),
      child: Text('continue'.tr),
    );
  }
}
