import 'package:ecommercecourse/core/constants/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final ThemeData appEnglishTheme = ThemeData(
    primarySwatch: Colors.blue,
    fontFamily: 'PlayfairDisplay',
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      iconTheme: const IconThemeData(color: AppColors.secondaryColor),
      titleTextStyle:const  TextStyle(
          color: AppColors.secondaryColor,
          // fontWeight: FontWeight.bold,
          fontFamily: "PlayfairDisplay",
          fontSize: 25),
      backgroundColor: Colors.grey[50],
    ),
    textTheme: const TextTheme(
        displayLarge: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.textColorblack),
        bodyLarge: TextStyle(
          height: 4,
          color: AppColors.greyTextColor,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        )));
final ThemeData appArabicTheme = ThemeData(
    primarySwatch: Colors.blue,
    fontFamily: 'Cairo',
    textTheme: const TextTheme(
        displayLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.textColorblack),
        bodyLarge: TextStyle(
          height: 4,
          color: AppColors.greyTextColor,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        )));
