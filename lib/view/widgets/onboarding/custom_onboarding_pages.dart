import 'package:zingoshop/controller/onboarding_controller.dart';
import 'package:zingoshop/core/constants/spaces.dart';
import 'package:zingoshop/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomOnboardingPages extends GetView<OnboardingControllerImpl> {
  const CustomOnboardingPages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (pageValue) {
        controller.onPageChanged(pageValue);
      },
      itemCount: onboardingList.length,
      itemBuilder: (context, index) {
        return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          AppSpacing.addHeigh(h40),
          Text(
            onboardingList[index].title,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(onboardingList[index].description,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge),
          ),
          AppSpacing.addHeigh(h40),
          AspectRatio(
            aspectRatio: 1.5,
            child: Image.asset(
              onboardingList[index].image,
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          ),
        ]);
      },
    );
  }
}
