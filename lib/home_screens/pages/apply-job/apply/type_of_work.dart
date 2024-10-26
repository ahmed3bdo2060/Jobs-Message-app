import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs/core/componnet/app_image.dart';
import 'package:jobs/core/componnet/app_input.dart';
import 'package:jobs/core/componnet/colors.dart';

class TypeOfWork extends StatefulWidget {
  const TypeOfWork({super.key});

  @override
  State<TypeOfWork> createState() => _TypeOfWorkState();
}

class _TypeOfWorkState extends State<TypeOfWork> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Apply Job",
        ),
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
                  child: AppImage(
                    "assets/svg/Submited.svg",
                    width: 91.w,
                    fit: BoxFit.cover,
                  ),
                ),
                AppImage(
                  "assets/images/Line.png",
                  width: 24.w,
                  hieght: 1,
                  color: AppColors.buttonColor,
                  fit: BoxFit.cover,
                ),
                Expanded(
                  child: AppImage(
                    "assets/svg/Shortlisted.svg",
                    width: 91.w,
                    color: AppColors.buttonColor,
                    fit: BoxFit.cover,
                  ),
                ),
                AppImage(
                  "assets/images/Line.jpg",
                  width: 24.w,
                  hieght: 1,
                  fit: BoxFit.cover,
                ),
                Expanded(
                  child: AppImage(
                    "assets/svg/Interview.svg",
                    width: 91.w,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 32.h,
            ),
            Text(
              "Type of work",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              "Fill in your bio data correctly",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.iconColor),
            ),
            SizedBox(
              height: 28.h,
            ),
            _item(),
            Spacer(),
            FilledButton(
              onPressed: () {},
              child: Text("Next",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
              style: FilledButton.styleFrom(
                  fixedSize: Size.fromHeight(48.h),
                  backgroundColor: AppColors.buttonColor),
            ),
            SizedBox(
              height: 9,
            )
          ],
        ),
      ),
    );
  }
}

class _item extends StatefulWidget {
  const _item({super.key});

  @override
  State<_item> createState() => _itemState();
}

class _itemState extends State<_item> {
  @override
  String? jobs;

  Widget build(BuildContext context) {
    return Column(

      children: [
        Padding(
        padding: EdgeInsets.only(bottom: 16.h),child: RadioListTile(
          value: " Senior UX Designer",
          title: Text('Senior UX Designer',
          style: TextStyle(fontWeight: FontWeight.w500,
          fontSize: 16)),
          subtitle: Text("CV.pdf . Portfolio.pdf",
          style: TextStyle(fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.iconColor)),
          activeColor: AppColors.buttonColor,
          controlAffinity: ListTileControlAffinity.trailing,
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: AppColors.borderColor
            )
          ),
          groupValue: jobs,
          onChanged: (value) {
            jobs = value;
            setState(() {

            });
          },
        ),
      ),
        Padding(
          padding: EdgeInsets.only(bottom: 16.h),child: RadioListTile(
          value: " Senior UI Designer",
          title: Text('Senior UI Designer',
              style: TextStyle(fontWeight: FontWeight.w500,
                  fontSize: 16)),
          subtitle: Text("CV.pdf . Portfolio.pdf",
              style: TextStyle(fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.iconColor)),
          activeColor: AppColors.buttonColor,
          controlAffinity: ListTileControlAffinity.trailing,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                  color: AppColors.borderColor
              )
          ),
          groupValue: jobs,
          onChanged: (value) {
            jobs = value;
            setState(() {

            });
          },
        ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 16.h),child: RadioListTile(
          value: " Graphik Designer",
          title: Text('Graphik Designer',
              style: TextStyle(fontWeight: FontWeight.w500,
                  fontSize: 16)),
          subtitle: Text("CV.pdf . Portfolio.pdf",
              style: TextStyle(fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.iconColor)),
          activeColor: AppColors.buttonColor,
          controlAffinity: ListTileControlAffinity.trailing,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                  color: AppColors.borderColor
              )
          ),
          groupValue: jobs,
          onChanged: (value) {
            jobs = value;
            setState(() {

            });
          },
        ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 16.h),child: RadioListTile(
          value: " Front-End Developer",
          title: Text('Front-End Developer',
              style: TextStyle(fontWeight: FontWeight.w500,
                  fontSize: 16)),
          subtitle: Text("CV.pdf . Portfolio.pdf",
              style: TextStyle(fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.iconColor)),
          activeColor: AppColors.buttonColor,
          controlAffinity: ListTileControlAffinity.trailing,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                  color: AppColors.borderColor
              )
          ),
          groupValue: jobs,
          onChanged: (value) {
            jobs = value;
            setState(() {

            });
          },
        ),
        ),
    ]);
  }
}
