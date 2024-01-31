import 'package:ecommercecourse/controller/onboarding_controller.dart';
import 'package:ecommercecourse/core/constants/spaces.dart';
import 'package:ecommercecourse/data/datasource/static/static.dart';
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
          AppSpacing.addHeigh(h80),
          Image.asset(onboardingList[index].image),
          AppSpacing.addHeigh(h80),
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
          )
        ]);
      },
    );
  }
}
