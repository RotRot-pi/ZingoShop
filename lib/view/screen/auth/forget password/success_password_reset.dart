import 'package:ecommercecourse/controller/auth/forget%20password/success_password_reset_controller.dart';
import 'package:ecommercecourse/core/constants/colors.dart';
import 'package:ecommercecourse/core/constants/spaces.dart';
import 'package:ecommercecourse/view/widgets/auth/custombuttonauth.dart';
import 'package:ecommercecourse/view/widgets/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessPasswordReset extends StatelessWidget {
  const SuccessPasswordReset({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessPasswordResetControllerImpl controller =
        Get.put(SuccessPasswordResetControllerImpl());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.whiteTextColor,
        elevation: 0.0,
        title: Text('32'.tr,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColors.greyColor)),
      ),
      body: Container(
        padding:
            AppSpacing.addEdgeInsetsSymmetric(vertical: p16, horizontal: p32),
        child: Column(children: [
          AppSpacing.addHeigh(h24),
          CustomTextTitleAuth(text: '36'.tr),
          AppSpacing.addSpace(),
          const Center(
            child: Icon(
              Icons.check_circle_outline_outlined,
              color: AppColors.primaryColor,
              size: s192,
            ),
          ),
          AppSpacing.addSpace(),
          SizedBox(
            width: double.infinity,
            child: CustomButtomAuth(
                text: "31".tr,
                onPressed: () {
                  controller.goToLogin();
                }),
          ),
          AppSpacing.addHeigh(h32),
        ]),
      ),
    );
  }
}
