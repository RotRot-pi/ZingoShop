import 'package:ecommercecourse/controller/onboarding_controller.dart';
import 'package:ecommercecourse/core/constants/spaces.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/onboarding/onboarding_barrel.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingControllerImpl());
    return Scaffold(
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
                  AppSpacing.addHeigh(h40),
                  const CustomOnboardingButton()
                ],
              ))
        ],
      )),
    );
  }
}
