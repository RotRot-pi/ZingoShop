import 'package:ecommercecourse/controller/settings_controller.dart';
import 'package:ecommercecourse/core/constants/colors.dart';
import 'package:ecommercecourse/core/constants/spaces.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsControllerImpl());
    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: h200,
                decoration: const BoxDecoration(color: AppColors.primaryColor),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                // color: Colors.black,
                height: h240,
                child: Container(
                  height: h96,
                  width: w96,
                  padding: AppSpacing.addEdgeInsetsAll(p4),
                  decoration: const BoxDecoration(
                      color: AppColors.whiteTextColor,
                      shape: BoxShape.circle),
                  child: const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/avatar.png'),
                  ),
                ),
              ),
            ],
          ),
          AppSpacing.addHeigh(h80),
          GetBuilder<SettingsControllerImpl>(
            builder: (controller) => Container(
              // color: Colors.blue,
              padding: AppSpacing.addEdgeInsetsSymmetric(horizontal: p16),

              //height: h200,
              child: Column(children: [
                ListTile(
                  // onTap: () {},
                  trailing: Switch(onChanged: (val) {}, value: true),
                  title: Text("Disable Notificatios"),
                ),
                ListTile(
                  onTap: () =>controller.goToAddress(),
                  trailing: Icon(Icons.location_on_outlined),
                  title: Text("Address"),
                ),
                ListTile(
                  onTap: () {},
                  trailing: Icon(Icons.help_outline_rounded),
                  title: Text("About us"),
                ),
                ListTile(
                  onTap: () {},
                  trailing: Icon(Icons.phone_callback_outlined),
                  title: Text("Contact us"),
                ),
                ListTile(
                  onTap: () {
                    controller.logout();
                  },
                  title: Text("Logout"),
                  trailing: Icon(Icons.exit_to_app),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
