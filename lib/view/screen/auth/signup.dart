import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:zingoshop/controller/auth/signup_controller.dart';
import 'package:zingoshop/core/constants/colors.dart';
import 'package:zingoshop/core/constants/spaces.dart';
import 'package:zingoshop/core/functions/exit_app_alert.dart';
import 'package:zingoshop/view/widgets/auth/logoauth.dart';
import 'package:zingoshop/view/animation/wave_animation_widget.dart';
import 'package:zingoshop/view/widgets/auth/sign_up_card.dart';
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
              SignUpCard(controller: controller),
            ]),
          ),
        ),
      ],
    );
  }
}
