import 'package:country_flags/country_flags.dart';
import 'package:zingoshop/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:zingoshop/core/constants/spaces.dart';

class LanguageButton extends StatelessWidget {
  final String language;
  final String languageCode;
  final bool isSelected;
  final Function()? onPressed;

  const LanguageButton({
    super.key,
    required this.language,
    required this.isSelected,
    required this.languageCode,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: AppSpacing.addEdgeInsetsSymmetric(horizontal: m24),
        child: PhysicalModel(
          elevation: 4,
          color: Colors.transparent,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(r20),
          shadowColor: AppColors.white,
          child: Container(
            width: double.infinity,
            height: h64,
            padding: AppSpacing.addEdgeInsetsSymmetric(
                vertical: p8, horizontal: p20),
            decoration: BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(r20),
              border: Border.all(
                color:
                    isSelected ? AppColors.primaryColor : AppColors.lightGrey,
                width: 2,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CountryFlag.fromLanguageCode(
                  languageCode,
                  shape: const Circle(),
                ),
                AppSpacing.addWidth(w16),
                Text(language,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
