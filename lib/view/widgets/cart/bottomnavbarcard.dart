// ignore_for_file: prefer_const_constructors

import 'package:zingoshop/controller/cart_controller.dart';
import 'package:zingoshop/core/constants/colors.dart';
import 'package:zingoshop/core/constants/spaces.dart';
import 'package:zingoshop/view/widgets/cart/buttoncart.dart';
import 'package:zingoshop/view/widgets/cart/customcouponwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BottomNavgationBarCart extends StatefulWidget {
  final String? price;
  final String? discount;
  final String? totalprice;
  final TextEditingController? controllercoupon;
  final VoidCallback? onApplyCoupon;
  final VoidCallback? onPressedOrder;
  const BottomNavgationBarCart({
    super.key,
    required this.price,
    required this.discount,
    required this.totalprice,
    this.onApplyCoupon,
    this.controllercoupon,
    this.onPressedOrder,
  });

  @override
  State<BottomNavgationBarCart> createState() => _BottomNavgationBarCartState();
}

class _BottomNavgationBarCartState extends State<BottomNavgationBarCart> {
  bool _isExpanded = false;
  bool _isBottomSheetExpanded = false;
  visible() {
    if (_isExpanded == true) {
      Future.delayed(Duration(milliseconds: 300), () {
        setState(() {
          _isBottomSheetExpanded = true;
        });
      });
    } else {
      setState(() {
        _isBottomSheetExpanded = false;
      });
    }
    return _isBottomSheetExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: _isExpanded ? h360 : h96, // Adjust these values as needed
        padding: AppSpacing.addEdgeInsetsSymmetric(horizontal: p4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryColor,
                ),
                child: Icon(
                  _isExpanded
                      ? Icons.keyboard_arrow_down
                      : Icons.keyboard_arrow_up,
                  size: 30,
                  color: AppColors.white,
                ),
              ),
            ),
            AppSpacing.addHeigh(h10),
            GetBuilder<CartController>(builder: (controller) {
              return controller.couponName == null
                  ? Container(
                      height: h40,
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(children: [
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: widget.controllercoupon,
                            textAlignVertical: TextAlignVertical.center,
                            cursorHeight: h20,
                            cursorColor: AppColors.primaryColor,
                            decoration: InputDecoration(
                                isDense: true,
                                hintText: "coupon_code".tr,
                                hintStyle:
                                    TextStyle(color: Colors.grey, height: h4),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.primaryColor,
                                        width: 2),
                                    borderRadius: BorderRadius.circular(r20)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.primaryColor,
                                        width: 1),
                                    borderRadius: BorderRadius.circular(r20))),
                          ),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: CustomButtonCoupon(
                            textButton: "apply".tr,
                            onPressed: widget.onApplyCoupon,
                          ),
                        ),
                      ]))
                  : Container(
                      alignment: Alignment.center,
                      child: Text.rich(
                          TextSpan(text: "${"coupon_code".tr}: ", children: [
                            TextSpan(
                                text: controller.couponName,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.black))
                          ]),
                          style: TextStyle(
                              color: AppColors.primaryColor, fontSize: 16.sp)),
                    );
            }),
            Visibility(
              visible: visible(),
              maintainAnimation: true,
              maintainState: true,
              child: Container(
                margin: AppSpacing.addEdgeInsetsSymmetric(
                    horizontal: m16, vertical: m8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(r20),
                    topRight: Radius.circular(r20),
                  ),
                  border: Border.all(color: AppColors.primaryColor, width: 2),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text("price".tr,
                                style: TextStyle(fontSize: 16))),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text("${widget.price} \$",
                                style: TextStyle(fontSize: 16)))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text("discount".tr,
                                style: TextStyle(fontSize: 16))),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text("${widget.discount} %",
                                style: TextStyle(fontSize: 16)))
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text("total_price".tr,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryColor))),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text("${widget.totalprice} \$",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryColor)))
                      ],
                    ),
                    SizedBox(height: 10),
                    CustomButtonCart(
                      textbutton: "place_order".tr,
                      onPressed: widget.onPressedOrder,
                    ),
                    SizedBox(height: 32.h),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
