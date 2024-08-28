import 'package:zingoshop/controller/auth/forget%20password/success_password_reset_controller.dart';
import 'package:zingoshop/core/constants/colors.dart';
import 'package:zingoshop/core/constants/spaces.dart';
import 'package:zingoshop/view/widgets/auth/custombuttonauth.dart';
import 'package:zingoshop/view/widgets/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessPasswordResetControllerImpl controller =
        Get.put(SuccessPasswordResetControllerImpl());
    return Scaffold(
      body: PopScope(
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) {
            //TODO: Show poping dialog
            //TODO: Make sure it worked

            controller.showPopingDialog();
          }
        },
        canPop: true,
        child: Container(
          padding:
              AppSpacing.addEdgeInsetsSymmetric(vertical: p16, horizontal: p32),
          child: Column(children: [
            AppSpacing.addHeigh(h24),
            CustomTextTitleAuth(text: 'account_creation_success'.tr),
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
                  text: "go_to_login".tr,
                  onPressed: () {
                    controller.goToLogin();
                  }),
            ),
            AppSpacing.addHeigh(h32),
          ]),
        ),
      ),
    );
  }
}
