import 'package:ecommercecourse/core/constants/colors.dart';
import 'package:ecommercecourse/core/constants/spaces.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String titleappbar;
  final void Function()? onPressedIcon;
  final void Function()? onPressedFavorite;
  final void Function()? onPressedSearch;
  const CustomAppBar(
      {super.key,
      required this.titleappbar,
      this.onPressedIcon,
      this.onPressedFavorite,
      this.onPressedSearch});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppSpacing.addEdgeInsetsOnly(top: p12),
      child: Row(children: [
        Expanded(
            child: TextFormField(
          decoration: InputDecoration(
              prefixIcon: IconButton(
                  icon: const Icon(Icons.search), onPressed: onPressedSearch),
              hintText: titleappbar,
              hintStyle: const TextStyle(fontSize: s16),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(r12)),
              filled: true,
              fillColor: AppColors.lightGrey),
        )),
        AppSpacing.addWidth(w10),
        Container(
          decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.circular(r12)),
          width: w64,
          padding: AppSpacing.addEdgeInsetsSymmetric(vertical: p8),
          child: IconButton(
              onPressed: onPressedIcon,
              icon: const Icon(
                Icons.notifications_active_outlined,
                size: s32,
                color: AppColors.secondaryGrey,
              )),
        ),
        AppSpacing.addWidth(w10),
        Container(
          decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.circular(r12)),
          width: w64,
          padding: AppSpacing.addEdgeInsetsSymmetric(vertical: p8),
          child: IconButton(
              onPressed: onPressedFavorite,
              icon: const Icon(
                Icons.favorite_outlined,
                size: s32,
                color: AppColors.secondaryGrey,
              )),
        )
      ]),
    );
  }
}
