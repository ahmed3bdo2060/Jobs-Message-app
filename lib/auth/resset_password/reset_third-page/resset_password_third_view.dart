import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:jobs/auth/create_account/bloc.dart';
import 'package:jobs/auth/create_account/create_account.dart';
import 'package:jobs/auth/create_account/events.dart';
import 'package:jobs/auth/create_account/second_page/create_account_second_view.dart';
import 'package:jobs/auth/create_account/state.dart';
import 'package:jobs/auth/login/state.dart';
import 'package:jobs/core/componnet/app_failed.dart';
import 'package:jobs/core/componnet/app_loading.dart';
import 'package:jobs/core/componnet/colors.dart';
import 'package:jobs/core/componnet/validator.dart';
import 'package:jobs/core/logic/helper_methods.dart';

import '../../../core/componnet/app_image.dart';
import '../../../core/componnet/app_input.dart';
import '../events.dart';
import '../state.dart';

class ResetPasswordThirdView extends StatefulWidget {
  const ResetPasswordThirdView({super.key});

  @override
  State<ResetPasswordThirdView> createState() => _ResetPasswordThirdViewState();
}

class _ResetPasswordThirdViewState extends State<ResetPasswordThirdView> {
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 24.w),
              child: AppImage(
                "assets/images/splash logo.png",
                hieght: 19.h,
                width: 81.w,
                fit: BoxFit.cover,
              ))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w).copyWith(top: 41.h),
        child: Align(
          alignment: AlignmentDirectional.bottomCenter,
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Reset Password",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Enter the email address you used when you joined and we’ll send you instructions to reset your password.",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: AppColors.descText),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  AppInput(
                    hint: "Password",
                    isPassword: true,
                    controller: passwordController,
                    validate: (value) => InputValidator.password(value),
                    onChange: (p0) {
                      setState(() {});
                    },
                    inputType: InputType.password,
                    prefixIcon: "assets/svg/lock.svg",
                  ),
                  SizedBox(height: 57.h,),
                  AppInput(
                    hint: "Confirm Password",
                    isPassword: true,
                    controller: confirmController,
                    validate: (value) => InputValidator.password(value),
                    onChange: (p0) {
                      setState(() {});
                    },
                    inputType: InputType.password,
                    prefixIcon: "assets/svg/lock.svg",
                  ),
                  SizedBox(
                    height: 20.h,
                  ),

                  SizedBox(
                    height: 299.h,
                  ),
            FilledButton(
              onPressed: () {
              },
              child: Text("Reset password",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 16)),
              style: FilledButton.styleFrom(
                  fixedSize: Size.fromHeight(48.h),
                  backgroundColor:
                  passwordController.text.isEmpty ||
                    confirmController.text.isEmpty
                      ? AppColors.borderColor
                      : AppColors.buttonColor),
            ),
                  SizedBox(
                    height: 8.h,
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
