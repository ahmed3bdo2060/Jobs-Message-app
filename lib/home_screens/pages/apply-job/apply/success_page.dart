import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs/core/componnet/app_image.dart';
import 'package:jobs/core/componnet/colors.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Apply Job"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 121,
        right: 37,left: 37,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: AppImage("assets/images/success_apply.png",
              width: 173,fit: BoxFit.cover,),
            ),
            SizedBox(height: 24.h,),
            Text("Your data has been successfully sent",
            textAlign: TextAlign.center,
            style:  TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500
            )),
            SizedBox(height: 12.h,),
            Text("You will get a message from our team, about the announcement of employee acceptance",
            textAlign: TextAlign.center,style: TextStyle(fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.iconColor),
            ),
            Spacer(),
            FilledButton(
              onPressed: () {},
              child: Text("Back to home",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16)),
              style: FilledButton.styleFrom(
                  fixedSize: Size.fromHeight(48.h),
                  backgroundColor:  AppColors.buttonColor),
            ),
            SizedBox(height: 9,)
          ],
        ),
      ),
    );
  }
}
