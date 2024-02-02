import 'package:ecommercecourse/controller/auth/forget password/verfiy_code_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import 'package:ecommercecourse/core/constants/colors.dart';
import 'package:ecommercecourse/core/constants/spaces.dart';
import 'package:ecommercecourse/view/widgets/auth/customtextbodyauth.dart';

import 'package:ecommercecourse/view/widgets/auth/customtexttitleauth.dart';

class VerifyCodeScreen extends StatelessWidget {
  const VerifyCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImpl controller = Get.put(VerifyCodeControllerImpl());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.whiteTextColor,
        elevation: 0.0,
        title: Text('40'.tr,
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
          CustomTextTitleAuth(text: "40".tr),
          AppSpacing.addHeigh(h12),
          CustomTextBodyAuth(text: "41".tr),
          AppSpacing.addHeigh(h24),
          OtpTextField(
              numberOfFields: 5,
              fieldWidth: w48,
              borderColor: AppColors.greyColor,
              showFieldAsBox: true,
              borderRadius: BorderRadius.circular(r16),
              //set to true to show as box or false to show as dash
              onSubmit: (String verificationCode) {
                // if(verificationCode== controller.verifiedCode){

                // }
                controller.goToResetPassword();
              }
              // showDialog(
              //     context: context,
              //     builder: (context) => AlertDialog(
              //           title: Text("Verification Code"),

              ),
        ]),
      ),
    );
  }
}
