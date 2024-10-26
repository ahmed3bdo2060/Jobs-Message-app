import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs/core/componnet/colors.dart';
import 'package:jobs/home_screens/pages/home_page/jobs.dart';

class Company extends StatefulWidget {
  const Company({super.key, required this.model});
final JobsModel model;
  @override
  State<Company> createState() => _CompanyState();
}

class _CompanyState extends State<Company> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Contact Us",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),),
          SizedBox(height: 8.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 157.w,
                padding: EdgeInsets.symmetric(vertical: 8,horizontal: 12),
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.borderColor)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Email",
                    style: TextStyle(
                      color: AppColors.iconColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400
                    ),),
                    SizedBox(height: 2,),
                    Text("${widget.model.compEmail}")
                  ],
                ),
              ),
              Container(
                width: 157.w,
                padding: EdgeInsets.symmetric(vertical: 8,horizontal: 12),
                decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.borderColor)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Website",
                      style: TextStyle(
                          color: AppColors.iconColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400
                      ),),
                    SizedBox(height: 2,),
                    Text("${widget.model.compWebsite}")
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 20,),
          Text("About Company",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),),
          SizedBox(height: 8.h,),
          Text("${widget.model.aboutComp}",
              style: TextStyle(fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.iconColor)),
        ],
      ),
    );
  }
}
