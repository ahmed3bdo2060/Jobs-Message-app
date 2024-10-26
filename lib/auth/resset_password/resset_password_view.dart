import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:jobs/auth/create_account/create_account.dart';
import 'package:jobs/auth/resset_password/reset_secong_page/reset_second_page.dart';
import 'package:jobs/core/componnet/app_loading.dart';
import 'package:jobs/core/componnet/colors.dart';
import 'package:jobs/core/logic/helper_methods.dart';
import '../../core/componnet/app_image.dart';
import '../../core/componnet/app_input.dart';
import 'bloc.dart';
import 'events.dart';
import 'state.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
final email = TextEditingController();
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
                    onChange: (p0) {
                      setState(() {});
                    },
                    hint: "Email",
                    controller: email,
                    prefixIcon: "assets/svg/sms.svg",
                  ),
                  SizedBox(
                    height: 20.h,
                  ),

                  SizedBox(
                    height: 355.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "You remember your password",
                        style: TextStyle(
                          color: AppColors.iconColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          navigateTo(CreateAccountView(), keepHistory: false);
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: AppColors.buttonColor),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
            FilledButton(
              onPressed: () {
                showMessage("Success",messageType: MessageType.Success);
                navigateTo(ResetPasswordSecondView());
              },
              child: Text("Request password reset",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 16)),
              style: FilledButton.styleFrom(
                  fixedSize: Size.fromHeight(48.h),
                  backgroundColor:
                  email.text.isEmpty
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
