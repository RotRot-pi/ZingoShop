import 'package:zingoshop/controller/onboarding_controller.dart';
import 'package:zingoshop/core/constants/colors.dart';
import 'package:zingoshop/core/constants/spaces.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/onboarding/onboarding_barrel.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OnboardingControllerImpl onBoardingController =
        Get.put(OnboardingControllerImpl());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0.0,
        actions: [
          GestureDetector(
            onTap: () => onBoardingController.skipOnboarding(),
            child: Container(
              padding: AppSpacing.addEdgeInsetsSymmetric(horizontal: w24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'skip'.tr,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: AppColors.primaryColor,
                        ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: AppColors.primaryColor,
                  )
                ],
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          const Expanded(
            flex: 3,
            child: CustomOnboardingPages(),
          ),
          Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const CustomOnboardingDots(),
                  // Spacer(
                  //   flex: 2,
                  // ),
                  AppSpacing.addHeigh(24),
                  const CustomOnboardingButton(),
                  AppSpacing.addHeigh(h24),
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: h8,
                    width: w100,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  AppSpacing.addHeigh(h8),
                ],
              ))
        ],
      )),
    );
  }
}
