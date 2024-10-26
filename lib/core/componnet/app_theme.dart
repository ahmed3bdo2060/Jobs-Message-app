import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs/core/componnet/colors.dart';

class AppTheme{
  static ThemeData get light=> ThemeData(fontFamily: "ABeeZeeRegular",
      inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: AppColors.iconColor),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: AppColors.borderColor,)),
          prefixIconColor:AppColors.iconColor,
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(
              color: AppColors.buttonColor,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
     hoverColor: Colors.black),
     textTheme: TextTheme()
  );
}