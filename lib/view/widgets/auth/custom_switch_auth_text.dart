import 'package:zingoshop/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomSwitchAuthText extends StatelessWidget {
  const CustomSwitchAuthText(
      {super.key, required this.text, required this.buttonText, this.onTap});
  final String text;
  final String buttonText;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text),
        InkWell(
          onTap: onTap,
          child: Text(buttonText,
              style: const TextStyle(
                  color: AppColors.primaryColor, fontWeight: FontWeight.bold)),
        )
      ],
    );
  }
}
