// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:zingoshop/controller/auth/signup_controller.dart';
import 'package:zingoshop/core/constants/colors.dart';
import 'package:zingoshop/core/constants/spaces.dart';
import 'package:zingoshop/core/functions/exit_app_alert.dart';
import 'package:zingoshop/core/functions/validate_auth_inputs.dart';
import 'package:zingoshop/view/widgets/auth/custom_switch_auth_text.dart';
import 'package:zingoshop/view/widgets/auth/custombuttonauth.dart';
import 'package:zingoshop/view/widgets/auth/customtextbodyauth.dart';
import 'package:zingoshop/view/widgets/auth/customtextformauth.dart';
import 'package:zingoshop/view/widgets/auth/customtexttitleauth.dart';
import 'package:zingoshop/view/widgets/auth/logoauth.dart';
import 'package:zingoshop/view/widgets/auth/wave_widget.dart';
import 'package:zingoshop/view/widgets/handeling_data_view.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SignUpControllerImpl());
    return Scaffold(
      body: GetBuilder<SignUpControllerImpl>(
          builder: (controller) => HandelingDataView(
              requestStatus: controller.requestStatus,
              child: _SingupPage(
                controller: controller,
              ))),
    );
  }
}

class _SingupPage extends StatelessWidget {
  const _SingupPage({
    required this.controller,
  });
  final SignUpControllerImpl controller;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WaveWidget(
            size: MediaQuery.of(context).size,
            yOffset: MediaQuery.of(context).size.height / 3.0,
            color: AppColors.primaryColor),
        Container(
          padding: AppSpacing.addEdgeInsetsSymmetric(horizontal: p24),
          child: Form(
            key: controller.formKey,
            child: ListView(children: [
              PopScope(
                canPop: false,
                onPopInvokedWithResult: (val, result) {
                  exitAppAlert(context);
                },
                child: Container(),
              ),
              const LogoAuth(),
              AppSpacing.addHeigh(h12),
              Card(
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
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('sign_up'.tr.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                  color: AppColors.black,
                                  fontSize: 36,
                                  fontWeight: FontWeight.w500)),
                      const SizedBox(height: 24),
                      CustonTextFormAuth(
                        controller: controller.usernameController,
                        validator: (val) {
                          validateAuthInputs(
                              val!, 25, 6, AuthInputType.username);
                          return null;
                        },

                        hinttext: "enter_username".tr,
                        iconData: Icons.person_outline,
                        labeltext: "username".tr,
                        // mycontroller: ,
                      ),
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
                      CustonTextFormAuth(
                        controller: controller.phoneController,
                        validator: (val) {
                          return validateAuthInputs(
                              val!, 15, 8, AuthInputType.phone);
                        },
                        inputType: AuthInputType.phone,
                        hinttext: "enter_phone".tr,
                        iconData: Icons.phone_android_outlined,
                        labeltext: "phone".tr,
                        // mycontroller: ,
                      ),
                      GetBuilder<SignUpControllerImpl>(builder: (controller) {
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
                      AppSpacing.addHeigh(h12),
                      CustomButtomAuth(
                          text: "sign_up".tr,
                          onPressed: () => controller.signUp()),
                      AppSpacing.addHeigh(h12),
                      CustomSwitchAuthText(
                          onTap: () => controller.goTologin(),
                          text: "have_account_query".tr,
                          buttonText: "login_title".tr),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
