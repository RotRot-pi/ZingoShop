import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zingoshop/controller/auth/login_controller.dart';
import 'package:zingoshop/core/constants/colors.dart';
import 'package:zingoshop/core/constants/spaces.dart';
import 'package:zingoshop/core/functions/validate_auth_inputs.dart';
import 'package:zingoshop/view/widgets/auth/custom_switch_auth_text.dart';
import 'package:zingoshop/view/widgets/auth/custombuttonauth.dart';
import 'package:zingoshop/view/widgets/auth/customtextformauth.dart';

class SignInCard extends StatelessWidget {
  const SignInCard({
    super.key,
    required this.controller,
  });

  final LogInControllerImpl controller;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: AppColors.white,
        elevation: 16,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(r20),
        ),
        child: Padding(
            padding: AppSpacing.addEdgeInsetsOnly(
              top: h36,
              right: w24,
              left: w24,
              bottom: h24,
            ),
            child: Column(children: [
              Text('sign_in'.tr.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: AppColors.black,
                      fontSize: 36,
                      fontWeight: FontWeight.w500)),
              const SizedBox(height: 24),
              CustonTextFormAuth(
                controller: controller.emailController,
                validator: (val) {
                  return validateAuthInputs(val!, 25, 8, AuthInputType.email);
                },
                hinttext: "enter_email".tr,
                iconData: Icons.email_outlined,
                labeltext: "email".tr,
                // mycontroller: ,
              ),
              GetBuilder<LogInControllerImpl>(builder: (controller) {
                return CustonTextFormAuth(
                  controller: controller.passwordController,
                  validator: (val) {
                    return validateAuthInputs(
                        val!, 25, 8, AuthInputType.password);
                  },
                  inputType: AuthInputType.password,
                  obscureText: controller.val,
                  hinttext: "enter_password".tr,
                  iconData: Icons.lock_outline,
                  onIconTap: () {
                    controller.showPassword();
                  },
                  labeltext: "password".tr,
                  // mycontroller: ,
                );
              }),
              InkWell(
                onTap: () {
                  controller.goToForgetPassword();
                },
                child: Text(
                  "forget_password".tr,
                  textAlign: TextAlign.end,
                ),
              ),
              const SizedBox(height: 32),
              CustomButtomAuth(
                  text: "login_title".tr.toUpperCase(),
                  onPressed: () {
                    controller.logIn();
                  }),
              const SizedBox(height: 32),
              CustomSwitchAuthText(
                  onTap: () => controller.goToSignUp(),
                  text: "no_account_query".tr,
                  buttonText: "sign_up".tr),
            ])));
  }
}
