import 'package:zingoshop/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:zingoshop/core/constants/spaces.dart';

class CustomButtonCart extends StatelessWidget {
  final String textbutton;
  final void Function()? onPressed;
  const CustomButtonCart({super.key, required this.textbutton, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w300,
      height: h40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(r20),
        color: AppColors.primaryColor,
      ),
      child: MaterialButton(
        textColor: AppColors.whiteTextColor,
        onPressed: onPressed,
        child: Text(textbutton,
            style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
