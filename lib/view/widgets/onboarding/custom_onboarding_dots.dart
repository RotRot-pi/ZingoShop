import 'package:ecommercecourse/controller/onboarding_controller.dart';
import 'package:ecommercecourse/core/constants/colors.dart';
import 'package:ecommercecourse/core/constants/spaces.dart';
import 'package:ecommercecourse/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomOnboardingDots extends StatelessWidget {
  const CustomOnboardingDots({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingControllerImpl>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
              onboardingList.length,
              (index) => AnimatedContainer(
                    margin: AppSpacing.addEdgeInsetsOnly(right: m4),
                    height: h8,
                    width: controller.currentPage == index ? w24 : w8,
                    duration: const Duration(milliseconds: 400),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(r20),
                        color: AppColors.primaryColor),
                  ))
        ],
      ),
    );
  }
}
