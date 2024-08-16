import 'package:zingoshop/controller/onboarding_controller.dart';
import 'package:zingoshop/core/constants/colors.dart';
import 'package:zingoshop/core/constants/spaces.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomOnboardingButton extends GetView<OnboardingControllerImpl> {
  const CustomOnboardingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(r20)),
      onPressed: () {
        controller.nextPage();
      },
      color: AppColors.primaryColor,
      textColor: AppColors.whiteTextColor,
      padding:
          AppSpacing.addEdgeInsetsSymmetric(horizontal: w100, vertical: zero),
      child: Text('next'.tr),
    );
  }
}
