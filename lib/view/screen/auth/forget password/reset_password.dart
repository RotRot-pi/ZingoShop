import 'package:ecommercecourse/controller/auth/forget password/reset_password_controller.dart';
import 'package:ecommercecourse/core/functions/validate_auth_inputs.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ecommercecourse/core/constants/colors.dart';
import 'package:ecommercecourse/core/constants/spaces.dart';
import 'package:ecommercecourse/view/widgets/auth/custombuttonauth.dart';
import 'package:ecommercecourse/view/widgets/auth/customtextbodyauth.dart';
import 'package:ecommercecourse/view/widgets/auth/customtextformauth.dart';
import 'package:ecommercecourse/view/widgets/auth/customtexttitleauth.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImpl controller =
        Get.put(ResetPasswordControllerImpl());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.whiteTextColor,
        elevation: 0.0,
        title: Text('42'.tr,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColors.greyColor)),
      ),
      body: Container(
        padding:
            AppSpacing.addEdgeInsetsSymmetric(vertical: p16, horizontal: p32),
        child: ListView(children: [
          AppSpacing.addHeigh(h24),
          CustomTextTitleAuth(text: "42".tr),
          AppSpacing.addHeigh(h12),
          CustomTextBodyAuth(text: " 34".tr),
          AppSpacing.addHeigh(h24),
          CustonTextFormAuth(
            controller: controller.passwordController,
            validator: (val) {
              return validateAuthInputs(val!, 25, 8, AuthInputType.password);
            },
            hinttext: "13".tr,
            iconData: Icons.email_outlined,
            labeltext: "19".tr,
            // mycontroller: ,
          ),
          CustonTextFormAuth(
            controller: controller.confirmPasswordController,
            validator: (val) {
              if (val != controller.passwordController.text) {
                return "35".tr;
              }
              return null;
            },
            hinttext: "43".tr,
            iconData: Icons.email_outlined,
            labeltext: "44".tr,
            // mycontroller: ,
          ),
          AppSpacing.addHeigh(h32),
          CustomButtomAuth(
              text: "33".tr,
              onPressed: () {
                controller.goToSuccessPasswordReset();
              }),
          AppSpacing.addHeigh(h32),
        ]),
      ),
    );
  }
}
