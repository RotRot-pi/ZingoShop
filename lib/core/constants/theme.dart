import 'package:ecommercecourse/core/constants/colors.dart';

import 'package:flutter/material.dart';

final ThemeData appEnglishTheme = ThemeData(
    primarySwatch: Colors.blue,
    fontFamily: 'PlayfairDisplay',
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
