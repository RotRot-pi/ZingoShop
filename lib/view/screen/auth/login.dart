import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zingoshop/controller/auth/login_controller.dart';
import 'package:zingoshop/core/constants/colors.dart';
import 'package:zingoshop/core/constants/spaces.dart';
import 'package:zingoshop/core/functions/exit_app_alert.dart';
import 'package:zingoshop/view/widgets/auth/logoauth.dart';
import 'package:zingoshop/view/widgets/auth/sign_in_card.dart';
import 'package:zingoshop/view/animation/wave_animation_widget.dart';
import 'package:zingoshop/view/widgets/handeling_data_view.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LogInControllerImpl());
    return Scaffold(
      body: GetBuilder<LogInControllerImpl>(
        builder: (controller) => HandelingDataView(
            requestStatus: controller.requestStatus, child: const LoginPage()),
      ),
    );
  }
}

class LoginPage extends GetView<LogInControllerImpl> {
  const LoginPage({
    super.key,
  });

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
          child: ListView(
            children: [
              PopScope(
                canPop: false,
                onPopInvokedWithResult: (val, result) {
                  exitAppAlert(context);
                },
                child: Container(),
              ),
              AppSpacing.addHeigh(h48),
              const LogoAuth(),
              AppSpacing.addHeigh(h24),
              Form(
                key: controller.formKey,
                child: SignInCard(controller: controller),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
