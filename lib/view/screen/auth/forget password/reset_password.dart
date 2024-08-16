import 'package:zingoshop/controller/auth/forget password/reset_password_controller.dart';
import 'package:zingoshop/core/functions/validate_auth_inputs.dart';
import 'package:zingoshop/view/widgets/handeling_data_view.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:zingoshop/core/constants/colors.dart';
import 'package:zingoshop/core/constants/spaces.dart';
import 'package:zingoshop/view/widgets/auth/custombuttonauth.dart';
import 'package:zingoshop/view/widgets/auth/customtextbodyauth.dart';
import 'package:zingoshop/view/widgets/auth/customtextformauth.dart';
import 'package:zingoshop/view/widgets/auth/customtexttitleauth.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImpl());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.whiteTextColor,
        elevation: 0.0,
        title: Text('reset_password'.tr,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColors.greyColor)),
      ),
      body: GetBuilder<ResetPasswordControllerImpl>(builder: (controller) {
        return HandelingDataView(
          requestStatus: controller.requestStatus,
          child: ResetPasswordPage(controller: controller),
        );
      }),
    );
  }
}

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({
    super.key,
    required this.controller,
  });
  final ResetPasswordControllerImpl controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          AppSpacing.addEdgeInsetsSymmetric(vertical: p16, horizontal: p32),
      child: Form(
        key: controller.formKey,
        child: ListView(children: [
          AppSpacing.addHeigh(h12),
          CustomTextBodyAuth(text: "enter_new_password".tr),
          AppSpacing.addHeigh(h24),
          GetBuilder<ResetPasswordControllerImpl>(builder: (controller) {
            return CustonTextFormAuth(
              controller: controller.passwordController,
              validator: (val) {
                return validateAuthInputs(val!, 25, 8, AuthInputType.password);
              },
              obscureText: controller.val,
              onIconTap: () {
                controller.showPassword();
              },
              inputType: AuthInputType.password,
              hinttext: "enter_password".tr,
              iconData: Icons.lock_outlined,
              labeltext: "new_password".tr,
              // mycontroller: ,
            );
          }),
          CustonTextFormAuth(
            controller: controller.confirmPasswordController,
            validator: (val) {
              if (val != controller.passwordController.text) {
                return "new_password".tr;
              }
              return null;
            },
            inputType: AuthInputType.password,
            obscureText: true,
            hinttext: "confirm_new_password".tr,
            iconData: Icons.lock_outline,
            labeltext: "confirm_new_password".tr,
            // mycontroller: ,
          ),
          AppSpacing.addHeigh(h32),
          CustomButtomAuth(
              text: "save".tr,
              onPressed: () {
                controller.resetPassword();
              }),
          AppSpacing.addHeigh(h32),
        ]),
      ),
    );
  }
}
