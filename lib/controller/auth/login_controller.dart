import 'package:ecommercecourse/core/classes/request_status.dart';
import 'package:ecommercecourse/core/constants/routes_name.dart';
import 'package:ecommercecourse/core/functions/handing_data.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/remote/auth/login_data.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LogInController extends GetxController {
  logIn();
  goToSignUp();
  goToForgetPassword();
  goToHomePage();
  showPassword();
}

class LogInControllerImpl extends LogInController {
  LoginData loginData = LoginData(crud: Get.find());
  final AppServices _appServices = Get.find();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  RequestStatus requestStatus = RequestStatus.notInitialized;
  bool val = true;
  @override
  logIn() async {
    if (formKey.currentState!.validate()) {
      print("=========Login is valid=========");
      requestStatus = RequestStatus.loading;
      update();
      var response = await loginData.postData(
        emailController.text,
        passwordController.text,
      );
      requestStatus = handelingData(response);
      print("requestStatus:$requestStatus");
      if (requestStatus == RequestStatus.success) {
        if (response['status'] == 'success') {
          var data = response['data'];
          print("id type:${data['user_id'].runtimeType}");
          _appServices.sharedPreferences
            ..setInt("id", data['user_id'])
            ..setString('username', data['user_name'])
            ..setString('email', data['user_email'])
            ..setString('phone', data['user_phone'])
            ..setInt('step', 2);
          print("DATA:$data");
          goToHomePage();
        }
      } else {
        Get.defaultDialog(
          title: "warning".tr,
          middleText: "user_already_exist".tr,
        );
        requestStatus;
      }

      update();
    } else {
      print("=========SignUp is not valid=========");
    }
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoutes.signup);
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword);
  }

  @override
  showPassword() {
    val == false ? val = true : val = false;
    update();
  }

  @override
  void onInit() async {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    //Note:I should request the persmission first
    //then get the token
    FirebaseMessaging.instance
      ..requestPermission()
      ..getToken().then((value) {
        print("token$value");
        String? token = value;
      });
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  goToHomePage() {
    Get.offNamed(AppRoutes.home);
  }
}
