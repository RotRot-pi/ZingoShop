import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Assuming you have a controller for home which is similar to login controller
import 'package:ecommercecourse/core/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImpl controller =
        Get.put(HomeControllerImpl()); // Uncomment if you have a HomeController
    return Scaffold(
      appBar: AppBar(
        title: Text('home'.tr),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
      ),
      body: Container(
        child: ListView(children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(children: [
              Expanded(
                  child: TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: "Find Product",
                    hintStyle: TextStyle(fontSize: 18),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)),
                    filled: true,
                    fillColor: Colors.grey[200]),
              )),
              SizedBox(width: 10),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10)),
                width: 60,
                padding: EdgeInsets.symmetric(vertical: 8),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications_active_outlined,
                      size: 30,
                      color: Colors.grey[600],
                    )),
              )
            ]),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Stack(children: [
              Container(
                alignment: Alignment.center,
                height: 150,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(20)),
                child: const ListTile(
                  title: Text("A summer surprise",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  subtitle: Text("Cashback 20%",
                      style: TextStyle(color: Colors.white, fontSize: 30)),
                ),
              ),
              Positioned(
                top: -20,
                right: -20,
                child: Container(
                  height: 160,
                  width: 160,
                  decoration: BoxDecoration(
                      color: AppColors.secondaryColor,
                      borderRadius: BorderRadius.circular(160)),
                ),
              )
            ]),
          )
        ]),
      ),
      // Add additional widgets here as per your requirements
    );
  }
}
