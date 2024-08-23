import 'package:flutter/material.dart';
import 'package:zingoshop/core/constants/spaces.dart';

import '../../../core/constants/colors.dart';

class CardPaymentMethodCheckout extends StatelessWidget {
  final String title;
  final bool isActive;
  final IconData icon;
  const CardPaymentMethodCheckout(
      {super.key,
      required this.title,
      required this.isActive,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          border: Border.all(
            color: isActive == true
                ? AppColors.secondaryColor
                : AppColors.secondaryColor.withAlpha(150),
          ),
          color: isActive == true ? AppColors.secondaryColor : AppColors.white,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Icon(icon,
              color: isActive == true
                  ? AppColors.white
                  : AppColors.secondaryColor.withAlpha(150),
              size: 20),
          AppSpacing.addWidth(w8),
          Text(title,
              style: TextStyle(
                  color: isActive == true ? Colors.white : AppColors.black,
                  height: 1,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
