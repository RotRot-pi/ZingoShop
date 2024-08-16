import 'package:zingoshop/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomButtonCoupon extends StatelessWidget {
  final String textButton;
  final void Function()? onPressed;
  const CustomButtonCoupon(
      {super.key, required this.textButton, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 20),
      color: AppColors.primaryColor,
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          textButton,
          style: const TextStyle(color: AppColors.whiteTextColor),
        ),
      ),
    );
  }
}
