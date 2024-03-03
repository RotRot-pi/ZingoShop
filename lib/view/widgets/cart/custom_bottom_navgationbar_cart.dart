// ignore_for_file: prefer_const_constructors

import 'package:ecommercecourse/core/constants/colors.dart';
import 'package:ecommercecourse/core/constants/spaces.dart';
import 'package:ecommercecourse/view/widgets/cart/buttoncart.dart';
import 'package:ecommercecourse/view/widgets/cart/custom_coupon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavgationBarCart extends StatelessWidget {
  final String price;
  final String discount;
  final String totalprice;
  final TextEditingController? controllercoupon;
  final VoidCallback? onApplyCoupon;
  const BottomNavgationBarCart(
      {Key? key,
      required this.price,
      required this.discount,
      required this.totalprice,
      this.onApplyCoupon,
      this.controllercoupon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            height: h40,
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(children: [

              Expanded(
                flex: 2,
                child: TextFormField(
                  controller: controllercoupon,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(

                      isDense: true,

                      // contentPadding:
                      //     AppSpacing.addEdgeInsetsOnly( left: 20, top: 10, bottom: 10),
                      hintText: "Coupon Code",
                      hintStyle: TextStyle(color: Colors.grey,height: h4),
                      border: OutlineInputBorder()),
                ),
              ),
              SizedBox(width: 5),
              Expanded(
                child: CustomButtonCoupon(
                  textButton: "apply",
                  onPressed: onApplyCoupon,
                ),
              ),
            ])),

        Container(
          margin: AppSpacing.addEdgeInsetsSymmetric(horizontal: m16, vertical: m8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),

            ),
            border: Border.all(color: AppColors.primaryColor),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("price", style: TextStyle(fontSize: 16))),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("$price \$", style: TextStyle(fontSize: 16)))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("discount", style: TextStyle(fontSize: 16))),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("$discount \$", style: TextStyle(fontSize: 16)))
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("Total Price",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor))),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("$totalprice \$",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor)))
                ],
              ),
              SizedBox(height: 10),
              CustomButtonCart(
                textbutton: "Place Order",
                onPressed: () {},
              ),
              SizedBox(height: 32.h),
            ],
          ),
        ),

      ],
    ));
  }
}
