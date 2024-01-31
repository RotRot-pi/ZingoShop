import 'package:ecommercecourse/controller/auth/forget password/forget_password_controller.dart';
import 'package:ecommercecourse/core/constants/routes_name.dart';
import 'package:ecommercecourse/core/functions/validate_auth_inputs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ecommercecourse/core/constants/colors.dart';
import 'package:ecommercecourse/core/constants/spaces.dart';
import 'package:ecommercecourse/view/widgets/auth/custombuttonauth.dart';
import 'package:ecommercecourse/view/widgets/auth/customtextbodyauth.dart';
import 'package:ecommercecourse/view/widgets/auth/customtextformauth.dart';
import 'package:ecommercecourse/view/widgets/auth/customtexttitleauth.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImpl controller =
        Get.put(ForgetPasswordControllerImpl());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.whiteTextColor,
        elevation: 0.0,
        title: Text('14'.tr,
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
          CustomTextTitleAuth(text: "14".tr),
          AppSpacing.addHeigh(h12),
          CustomTextBodyAuth(text: "29".tr),
          AppSpacing.addHeigh(h24),
          CustonTextFormAuth(
            controller: controller.emailController,
            validator: (val) {
              return validateAuthInputs(val!, 25, 8, AuthInputType.email);
            },
            hinttext: "12".tr,
            iconData: Icons.email_outlined,
            labeltext: "18".tr,
            // mycontroller: ,
          ),
          AppSpacing.addHeigh(h32),
          CustomButtomAuth(
              text: "30".tr,
              onPressed: () {
                Get.toNamed(AppRoutes.verifyCode);
              }),
          AppSpacing.addHeigh(h32),
        ]),
      ),
    );
  }
}
