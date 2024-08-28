// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import 'package:zingoshop/controller/home_controller.dart';
import 'package:zingoshop/core/constants/colors.dart';
import 'package:zingoshop/core/constants/spaces.dart';

class CustomAppBar extends GetView<HomeControllerImpl> {
  final String searchHintText;
  final IconData? fistActionIcon;
  final void Function()? fistActionOnPressed;
  final IconData? secondActionIcon;
  final void Function()? secondActionOnPressed;
  final void Function()? onPressedSearch;
  final void Function(String)? onChanged;
  final TextEditingController? searchController;
  final bool goBack;
  const CustomAppBar({
    super.key,
    required this.searchHintText,
    this.fistActionIcon,
    this.fistActionOnPressed,
    this.secondActionIcon,
    this.secondActionOnPressed,
    this.onPressedSearch,
    this.onChanged,
    this.searchController,
    this.goBack = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppSpacing.addEdgeInsetsOnly(top: p12),
      height: 54.h,
      child: Row(children: [
        goBack == true
            ? IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.primaryColor,
                ),
              )
            : const SizedBox(),
        Expanded(
          child: CustomSearchWidget(
              searchController: searchController,
              onChanged: onChanged,
              onPressedSearch: onPressedSearch,
              searchHintText: searchHintText),
        ),
        fistActionIcon != null
            ? IconButton(
                onPressed: fistActionOnPressed,
                icon: Icon(
                  fistActionIcon,
                  color: AppColors.primaryColor,
                ),
              )
            : const SizedBox(),
        secondActionIcon != null
            ? IconButton(
                onPressed: secondActionOnPressed,
                icon: Icon(
                  secondActionIcon,
                  color: AppColors.primaryColor,
                ),
              )
            : const SizedBox(),
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
