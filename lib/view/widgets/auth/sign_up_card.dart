import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:zingoshop/controller/auth/signup_controller.dart';
import 'package:zingoshop/core/constants/colors.dart';
import 'package:zingoshop/core/constants/spaces.dart';
import 'package:zingoshop/core/functions/validate_auth_inputs.dart';
import 'package:zingoshop/view/widgets/auth/custom_switch_auth_text.dart';
import 'package:zingoshop/view/widgets/auth/custombuttonauth.dart';
import 'package:zingoshop/view/widgets/auth/customtextformauth.dart';

class SignUpCard extends StatefulWidget {
  const SignUpCard({
    super.key,
    required this.controller,
  });

  final SignUpControllerImpl controller;

  @override
  State<SignUpCard> createState() => _SignUpCardState();
}

class _SignUpCardState extends State<SignUpCard> with TickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 1),
        end: Offset.zero,
      ).animate(CurvedAnimation(
          parent: _animationController, curve: Curves.easeInOut)),
      child: FadeTransition(
        opacity: Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
            parent: _animationController, curve: Curves.easeInOut)),
        child: Card(
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
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: AppColors.black,
                        fontSize: 36,
                        fontWeight: FontWeight.w500)),
                const SizedBox(height: 24),
                CustonTextFormAuth(
                  controller: widget.controller.usernameController,
                  validator: (val) {
                    validateAuthInputs(val!, 25, 6, AuthInputType.username);
                    return null;
                  },
                  hinttext: "enter_username".tr,
                  iconData: Icons.person_outline,
                  labeltext: "username".tr,
                ),
                CustonTextFormAuth(
                  controller: widget.controller.emailController,
                  validator: (val) {
                    return validateAuthInputs(val!, 25, 8, AuthInputType.email);
                  },
                  hinttext: "enter_email".tr,
                  iconData: Icons.email_outlined,
                  labeltext: "email".tr,
                ),
                CustonTextFormAuth(
                  controller: widget.controller.phoneController,
                  validator: (val) {
                    return validateAuthInputs(val!, 15, 8, AuthInputType.phone);
                  },
                  inputType: AuthInputType.phone,
                  hinttext: "enter_phone".tr,
                  iconData: Icons.phone_android_outlined,
                  labeltext: "phone".tr,
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
                  );
                }),
                AppSpacing.addHeigh(h12),
                CustomButtomAuth(
                    text: "sign_up".tr,
                    onPressed: () => widget.controller.signUp()),
                AppSpacing.addHeigh(h12),
                CustomSwitchAuthText(
                    onTap: () => widget.controller.goTologin(),
                    text: "have_account_query".tr,
                    buttonText: "login_title".tr),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
