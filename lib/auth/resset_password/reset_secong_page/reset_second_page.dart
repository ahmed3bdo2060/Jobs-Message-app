import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs/auth/resset_password/reset_third-page/resset_password_third_view.dart';
import 'package:jobs/core/componnet/app_image.dart';
import 'package:jobs/core/componnet/colors.dart';
import 'package:jobs/core/logic/helper_methods.dart';

class ResetPasswordSecondView extends StatelessWidget {
  const ResetPasswordSecondView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w).copyWith(top: 160.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: AppImage("assets/images/emailillustration.png",
              hieght: 142.h,
              width: 173.w,
              fit: BoxFit.cover,),
            ),
            SizedBox(height: 24.h,),
            Text("Check your Email",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 24
            ),),
            SizedBox(height: 8.h,),
            Text("We have sent a reset password to your email address",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: AppColors.iconColor,
            ),
            textAlign: TextAlign.center,),
            Spacer(),
            FilledButton(
              onPressed: () {
                navigateTo(ResetPasswordThirdView());
              },
              child: Text("Open email app",
                  style:
                  TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
              style: FilledButton.styleFrom(
                  fixedSize: Size.fromHeight(48.h),
                  backgroundColor: AppColors.buttonColor),
            ),
            SizedBox(height: 8.h,)
          ],
        ),
      ),
    );
  }
}
