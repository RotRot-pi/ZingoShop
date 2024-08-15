// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ecommercecourse/controller/auth/signup_controller.dart';
import 'package:ecommercecourse/core/constants/colors.dart';
import 'package:ecommercecourse/core/functions/exit_app_alert.dart';
import 'package:ecommercecourse/core/functions/validate_auth_inputs.dart';
import 'package:ecommercecourse/view/widgets/auth/custom_switch_auth_text.dart';
import 'package:ecommercecourse/view/widgets/auth/custombuttonauth.dart';
import 'package:ecommercecourse/view/widgets/auth/customtextbodyauth.dart';
import 'package:ecommercecourse/view/widgets/auth/customtextformauth.dart';
import 'package:ecommercecourse/view/widgets/auth/customtexttitleauth.dart';
import 'package:ecommercecourse/view/widgets/handeling_data_view.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SignUpControllerImpl());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.whiteTextColor,
        elevation: 0.0,
        title: Text('sign_up'.tr,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColors.greyColor)),
      ),
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
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      child: Column(
        children: [
          Form(
            key: controller.formKey,
            child: Expanded(
              child: ListView(children: [
                const SizedBox(height: 24),
                const SizedBox(height: 12),
                CustomTextBodyAuth(text: "signup_instructions".tr),
                const SizedBox(height: 24),
                CustonTextFormAuth(
                  controller: controller.usernameController,
                  validator: (val) {
                    validateAuthInputs(val!, 25, 6, AuthInputType.username);
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
                    return validateAuthInputs(val!, 25, 8, AuthInputType.email);
                  },
                  hinttext: "enter_email".tr,
                  iconData: Icons.email_outlined,
                  labeltext: "email".tr,
                  // mycontroller: ,
                ),
                CustonTextFormAuth(
                  controller: controller.phoneController,
                  validator: (val) {
                    return validateAuthInputs(val!, 15, 8, AuthInputType.phone);
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
                const SizedBox(height: 32),
                CustomButtomAuth(
                    text: "sign_up".tr, onPressed: () => controller.signUp()),
                const SizedBox(height: 32),
                CustomSwitchAuthText(
                    onTap: () => controller.goTologin(),
                    text: "have_account_query".tr,
                    buttonText: "login_title".tr),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
