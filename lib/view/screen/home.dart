import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Assuming you have a controller for home which is similar to login controller
import 'package:ecommercecourse/core/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.lazyPut(() => HomeControllerImpl()); // Uncomment if you have a HomeController
    return Scaffold(
      appBar: AppBar(
        title: Text('home'.tr),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
      ),
      body: Center(
        child: Text('Welcome to the Home Screen!',
            style: Theme.of(context).textTheme.headlineMedium),
      ),
      // Add additional widgets here as per your requirements
    );
  }
}
