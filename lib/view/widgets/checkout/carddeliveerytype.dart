
import 'package:ecommercecourse/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CardDeliveryTypeCheckout extends StatelessWidget {
  final String imagename ; 
  final String title  ; 
  final bool active   ; 
  const CardDeliveryTypeCheckout({Key? key, required this.imagename, required this.title, required this.active}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
          color:active  ? AppColors.secondaryColor : null ,
          border: Border.all(color: AppColors.secondaryColor)),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(
          imagename,
          width: 60,
          color:active ? Colors.white : null ,
        ),
        Text(
          title,
          style: TextStyle(color:active ? Colors.white : AppColors.secondaryColor, fontWeight:FontWeight.bold ),
        )
      ]),
    );
  }
}
