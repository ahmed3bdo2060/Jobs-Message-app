import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs/core/componnet/app_image.dart';
import 'package:jobs/core/componnet/colors.dart';

class ResetPasswordForthView extends StatelessWidget {
  const ResetPasswordForthView({super.key});

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
              child: AppImage("assets/images/PasswordSuccesfullyIlustration.png",
              hieght: 142.h,
              width: 173.w,
              fit: BoxFit.cover,),
            ),
            SizedBox(height: 24.h,),
            Text("Password changed succesfully!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 24
            ),),
            SizedBox(height: 8.h,),
            Text("Your password has been changed successfully, we will let you know if there are more problems with your account",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: AppColors.iconColor,
            ),
            textAlign: TextAlign.center,),
            Spacer(),
            FilledButton(
              onPressed: () {},
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
