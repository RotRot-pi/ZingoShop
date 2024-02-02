import 'package:ecommercecourse/core/constants/colors.dart';
import 'package:flutter/material.dart';

class LanguageButton extends StatelessWidget {
  final String language;
  final VoidCallback onPressed;

  const LanguageButton({
    super.key,
    required this.language,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: AppColors.primaryColor,
      child: Text(language,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontWeight: FontWeight.bold, color: AppColors.whiteTextColor)),
    );
  }
}
