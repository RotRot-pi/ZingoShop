import 'dart:io';

import 'package:ecommercecourse/controller/auth/login_controller.dart';
import 'package:ecommercecourse/core/constants/colors.dart';
import 'package:ecommercecourse/core/functions/exit_app_alert.dart';
import 'package:ecommercecourse/core/functions/validate_auth_inputs.dart';
import 'package:ecommercecourse/view/widgets/auth/custom_switch_auth_text.dart';
import 'package:ecommercecourse/view/widgets/auth/custombuttonauth.dart';
import 'package:ecommercecourse/view/widgets/auth/customtextbodyauth.dart';
import 'package:ecommercecourse/view/widgets/auth/customtextformauth.dart';
import 'package:ecommercecourse/view/widgets/auth/customtexttitleauth.dart';
import 'package:ecommercecourse/view/widgets/auth/logoauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LogInControllerImpl());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.whiteTextColor,
        elevation: 0.0,
        title: Text('login_title'.tr,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColors.greyColor)),
      ),
      body: GetBuilder<LogInControllerImpl>(
        builder: (controller) => Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Column(
            children: [
              PopScope(
                canPop: false,
                onPopInvoked: (val) {
                  exitAppAlert(context);
                },
                child: Container(),
              ),
              Form(
                key: controller.formKey,
                child: Expanded(
                  child: ListView(children: [
                    const LogoAuth(),
                    const SizedBox(height: 24),
                    CustomTextTitleAuth(text: 'welcome_back'.tr),
                    const SizedBox(height: 12),
                    CustomTextBodyAuth(text: 'login_instructions'.tr),
                    const SizedBox(height: 24),
                    CustonTextFormAuth(
                      controller: controller.emailController,
                      validator: (val) {
                        return validateAuthInputs(
                            val!, 25, 8, AuthInputType.email);
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
                        text: "login_title".tr,
                        onPressed: () {
                          controller.logIn();
                        }),
                    const SizedBox(height: 32),
                    CustomSwitchAuthText(
                        onTap: () => controller.goToSignUp(),
                        text: "no_account_query".tr,
                        buttonText: "sign_up".tr),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
