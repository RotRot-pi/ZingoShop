import 'package:zingoshop/core/constants/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final ThemeData appEnglishTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    fontFamily: 'OpenSans',
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      iconTheme: const IconThemeData(color: AppColors.secondaryColor),
      titleTextStyle: TextStyle(
          color: AppColors.secondaryColor,
          // fontWeight: FontWeight.bold,
          fontFamily: "OpenSans",
          fontSize: 25.sp),
      backgroundColor: Colors.grey[50],
    ),
    textTheme: TextTheme(
        displayLarge: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.textColorblack),
        bodyLarge: TextStyle(
          height: 4,
          color: AppColors.greyTextColor,
          fontWeight: FontWeight.bold,
          fontSize: 14.sp,
        ),
        bodyMedium: TextStyle(
          color: AppColors.black.withAlpha(200),
          fontSize: 12.sp,
        ),
        bodySmall: TextStyle(
          color: AppColors.black.withAlpha(200),
          fontSize: 10.spMin,
        )));
final ThemeData appArabicTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    fontFamily: 'Cairo',
    textTheme: TextTheme(
        displayLarge: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.textColorblack),
        bodyLarge: TextStyle(
          height: 4,
          color: AppColors.greyTextColor,
          fontWeight: FontWeight.bold,
          fontSize: 12.sp,
        )));
