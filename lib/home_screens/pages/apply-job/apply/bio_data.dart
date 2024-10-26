import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs/core/componnet/app_image.dart';
import 'package:jobs/core/componnet/app_input.dart';
import 'package:jobs/core/componnet/colors.dart';

class ApplyBioDatat extends StatefulWidget {
  const ApplyBioDatat({super.key});

  @override
  State<ApplyBioDatat> createState() => _ApplyBioDatatState();
}

class _ApplyBioDatatState extends State<ApplyBioDatat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Apply Job",),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 23.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: AppImage("assets/svg/Submited.svg",
                  width: 91.w,
                  fit: BoxFit.cover,),
                ),
                AppImage("assets/images/Line.jpg",
                width: 24.w,
                hieght: 1,
                fit: BoxFit.cover,),
                Expanded(
                  child: AppImage("assets/svg/Shortlisted.svg",
                  width: 91.w,
                  fit: BoxFit.cover,),
                ),
                AppImage("assets/images/Line.jpg",
                  width: 24.w,
                  hieght: 1,
                  fit: BoxFit.cover,),
                Expanded(
                  child: AppImage("assets/svg/Interview.svg",
                  width: 91.w,
                  fit: BoxFit.cover,),
                ),
              ],
            ),
            SizedBox(
              height: 32.h,
            ),
            Text("Biodata",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20
            ),),
            SizedBox(height: 4.h,),
            Text("Fill in your bio data correctly",style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.iconColor
            ),),
            SizedBox(height: 28.h,),
            Text("Full Name*",style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16
            ),),
            SizedBox(height: 8,),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius
                        .circular(8),
                  ),
                  constraints: BoxConstraints(
                      maxHeight: 56.h),
                  prefix: Padding(
                      padding: EdgeInsets.only(
                          left: 12)),
                  prefixIconConstraints: BoxConstraints(
                      minHeight: 20,
                      minWidth: 20,
                      maxWidth: 40,
                      maxHeight: 40
                  ),
                  contentPadding: EdgeInsets.only(
                      left: 20, top: 18,
                      bottom: 18),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(
                        left: 12),
                    child: AppImage(
                        "assets/svg/profile (1).svg",
                        width: 20,
                        color: AppColors.iconColor,
                        hieght: 20,
                        fit: BoxFit.cover),
                  )
              ),
            ),
            SizedBox(height: 20.h,),
            Text("Full Name*",style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16
            ),),
            SizedBox(height: 8,),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius
                        .circular(8),
                  ),
                  constraints: BoxConstraints(
                      maxHeight: 56.h),
                  prefix: Padding(
                      padding: EdgeInsets.only(
                          left: 12)),
                  prefixIconConstraints: BoxConstraints(
                      minHeight: 20,
                      minWidth: 20,
                      maxWidth: 40,
                      maxHeight: 40
                  ),
                  contentPadding: EdgeInsets.only(
                      left: 20, top: 18,
                      bottom: 18),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(
                        left: 12),
                    child: AppImage(
                        "assets/svg/sms.svg",
                        width: 20,
                        color: AppColors.iconColor,
                        hieght: 20,
                        fit: BoxFit.cover),
                  )
              ),
            ),
            SizedBox(
               height: 20.h,
            ),
            Text("Full Name*",style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16
            ),),
            SizedBox(height: 8,),
            Container(
              height: 56,
              width: double.infinity,
              constraints: BoxConstraints(maxHeight: 56,
                  maxWidth: double.infinity),
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.borderColor,),
                shape: BoxShape.rectangle,
              ),
              child: Row(
                children: [
                  AppImage("assets/images/usa.png",
                    width: 20,hieght: 20,),
                  SizedBox(width: 12,),
                  InkWell(
                    onTap: () {
                      DropdownMenu(dropdownMenuEntries: [

                      ],);
                    },
                    child: AppImage("assets/svg/arrow-down.svg",width: 20,hieght: 20,
                      color: Colors.black,),
                  ),
                  SizedBox(
                    width: 33,
                  ),
                  Text("",style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14
                  ),),
                ],
              ),
            ),
            Spacer(),
            FilledButton(
              onPressed: () {},
              child: Text("Next",
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
