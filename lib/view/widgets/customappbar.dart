import 'dart:ui';

import 'package:zingoshop/controller/home_controller.dart';
import 'package:zingoshop/core/constants/colors.dart';
import 'package:zingoshop/core/constants/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class CustomAppBar extends GetView<HomeControllerImpl> {
  final String searchHintText;
  final void Function()? onPressedIcon;
  final void Function()? onPressedFavorite;
  final void Function()? onPressedSearch;
  final void Function(String)? onChanged;
  final TextEditingController? searchController;
  const CustomAppBar(
      {super.key,
      required this.searchHintText,
      this.searchController,
      this.onPressedIcon,
      this.onPressedFavorite,
      this.onPressedSearch,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppSpacing.addEdgeInsetsOnly(top: p12),
      height: 54.h,
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Expanded(
            child: CustomSearchWidget(
                searchController: searchController,
                onChanged: onChanged,
                onPressedSearch: onPressedSearch,
                searchHintText: searchHintText)),
        // AppSpacing.addWidth(w10),
        // Container(
        //   decoration: BoxDecoration(
        //       color: AppColors.lightGrey,
        //       borderRadius: BorderRadius.circular(r12)),
        //   width: w64,
        //   padding: AppSpacing.addEdgeInsetsSymmetric(vertical: p8),
        //   child: IconButton(
        //       onPressed: onPressedIcon,
        //       icon: const Icon(
        //         Icons.notifications_active_outlined,
        //         size: s32,
        //         color: AppColors.secondaryGrey,
        //       )),
        // ),
        // AppSpacing.addWidth(w10),
        // Container(
        //   decoration: BoxDecoration(
        //       color: AppColors.lightGrey,
        //       borderRadius: BorderRadius.circular(r12)),
        //   width: w64,
        //   padding: AppSpacing.addEdgeInsetsSymmetric(vertical: p8),
        //   child: IconButton(
        //       onPressed: onPressedFavorite,
        //       icon: const Icon(
        //         Icons.favorite_outlined,
        //         size: s32,
        //         color: AppColors.secondaryGrey,
        //       )),
        // )
      ]),
    );
  }
}

class CustomSearchWidget extends StatelessWidget {
  const CustomSearchWidget({
    super.key,
    required this.searchController,
    required this.onChanged,
    required this.onPressedSearch,
    required this.searchHintText,
  });
  final TextEditingController? searchController;
  final void Function(String p1)? onChanged;
  final void Function()? onPressedSearch;
  final String searchHintText;
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Colors.grey[600],
        ),
        child: TextFormField(
          controller: searchController,
          onChanged: onChanged,
          cursorHeight: h24,
          style:
              TextStyle(color: AppColors.black.withAlpha(200), fontSize: 14.sp),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            filled: true,
            prefixIcon: IconButton(
                icon: const Icon(Icons.search), onPressed: onPressedSearch),
            fillColor: const Color(0xFFF2F4F5),
            hintStyle: TextStyle(color: Colors.grey[600]),
            hintText: searchHintText,
          ),
          autofocus: false,
        ));
  }
}
