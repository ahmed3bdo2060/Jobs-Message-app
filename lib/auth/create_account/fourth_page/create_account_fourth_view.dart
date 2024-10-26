import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs/auth/login/login_view.dart';
import 'package:jobs/core/componnet/app_image.dart';
import 'package:jobs/core/componnet/colors.dart';
import 'package:jobs/core/logic/helper_methods.dart';

class CreateAccountFourthView extends StatelessWidget {
  const CreateAccountFourthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w).copyWith(top: 97.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: AppImage("assets/images/Success Account Ilustration.png",
              hieght: 142.h,
              width: 173.w,
              fit: BoxFit.cover,),
            ),
            SizedBox(height: 24.h,),
            Text("Your account has been set up!",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 24
            ),),
            SizedBox(height: 8.h,),
            Text("We have customized feeds according to your preferences",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: AppColors.iconColor,
            ),
            textAlign: TextAlign.center,),
            Spacer(),
            FilledButton(
              onPressed: () {
                navigateTo(LoginView());
              },
              child: Text("Get Started",
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
