import 'package:zingoshop/core/constants/colors.dart';
import 'package:zingoshop/core/constants/spaces.dart';
import 'package:zingoshop/core/localization/change_local.dart';
import 'package:zingoshop/view/widgets/language/custom_language_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageScreen extends GetView<LocalizationController> {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.white,
          centerTitle: true,
          title: Text('language'.tr,
              style: Theme.of(context).textTheme.displayLarge),
          actions: [
            Padding(
              padding: AppSpacing.addEdgeInsetsSymmetric(
                horizontal: w24,
              ),
              child: GetBuilder<LocalizationController>(builder: (controller) {
                return IconButton(
                  padding: AppSpacing.addEdgeInsetsAll(zero),
                  constraints: BoxConstraints.tight(Size(w56, h28)),
                  iconSize: s20,
                  alignment: Alignment.center,
                  style: IconButton.styleFrom(
                      fixedSize: Size(w56, h24),
                      backgroundColor: controller.done
                          ? AppColors.primaryColor
                          : AppColors.white,
                      shape: const StadiumBorder(
                        side:
                            BorderSide(color: AppColors.primaryColor, width: 2),
                      )),
                  icon: Icon(
                    Icons.check,
                    weight: 2,
                    color: controller.done
                        ? AppColors.white
                        : AppColors.primaryColor,
                  ),
                  onPressed: controller.done
                      ? () {
                          controller.changeLanguage();

                          controller.goToOnboarding();
                        }
                      : null,
                );
              }),
            ),
          ]),
      body: Center(
        child: GetBuilder<LocalizationController>(builder: (controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppSpacing.addHeigh(h32),
              LanguageButton(
                language: 'english'.tr,
                languageCode: 'en',
                isSelected: controller.selectedLanguage == 'en',
                onPressed: () => controller.selectLanguge('en'),
              ),
              AppSpacing.addHeigh(h16),
              LanguageButton(
                language: 'arabic'.tr,
                languageCode: 'ar-dz',
                isSelected: controller.selectedLanguage == 'ar',
                onPressed: () => controller.selectLanguge('ar'),
              ),
              AppSpacing.addHeigh(h16),
              LanguageButton(
                language: 'french'.tr,
                languageCode: 'fr',
                isSelected: controller.selectedLanguage == 'fr',
                onPressed: () => controller.selectLanguge('fr'),
              ),
            ],
          );
        }),
      ),
    );
  }
}
