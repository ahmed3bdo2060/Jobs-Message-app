import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs/core/componnet/app_image.dart';
import 'package:jobs/core/componnet/colors.dart';
import 'package:jobs/home_screens/pages/apply-job/aplly_job_componnent/descreption.dart';
import 'package:jobs/home_screens/pages/apply-job/aplly_job_componnent/people.dart';
import 'package:jobs/home_screens/pages/home_page/jobs.dart';

import 'aplly_job_componnent/company.dart';

class JobDetails extends StatefulWidget {
  const JobDetails({super.key, required this.model});
  final JobsModel model;
  @override
  State<JobDetails> createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Job Detail',),
        actions: [
          AppImage("assets/svg/boldarchive-minus.svg",
        width: 20,hieght: 20,),
          SizedBox(width: 24,),],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppImage("${widget.model.image}",
            width: 48,hieght: 48,),
            SizedBox(height: 12.h,),
            Text('${widget.model.name}',
            style: TextStyle(fontWeight: FontWeight.w500,
            fontSize: 20),textAlign: TextAlign.center,),
            SizedBox(height: 4.h,),
            Text('Twitter • Jakarta, Indonesia ',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.iconColor
            ),),
            SizedBox(height: 16.h,),
            Center(
              child: Row(children: [
                Container(width: 72.w,
                  padding: EdgeInsets.only(top: 4),
                  decoration: BoxDecoration(
                    color: Color(0xffD6E4FF),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  height: 26.h,child: Text(textAlign: TextAlign.center,"${widget.model.jobTimeType}",
                      style: TextStyle(color: AppColors.buttonColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 12)),),
                SizedBox(width: 4,),
                Container(width: 72.w,
                  padding: EdgeInsets.only(top: 4),
                  decoration: BoxDecoration(
                    color: Color(0xffD6E4FF),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  height: 26.h,child: Text("Remote",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: AppColors.buttonColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 12)),),
                SizedBox(width: 4,),
                Container(width: 72.w,
                  padding: EdgeInsets.only(top: 4),
                  decoration: BoxDecoration(
                    color: Color(0xffD6E4FF),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  height: 26.h,child: Text(textAlign: TextAlign.center,"${widget.model.jobType}",
                      style: TextStyle(color: AppColors.buttonColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 12)),),
              ],
              mainAxisSize: MainAxisSize.min,
              ),
            ),
            SizedBox(height: 32.h,),
            Expanded(
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    TabBar(
                    indicator: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: AppColors.darkBlue,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: Colors.white,
                    unselectedLabelColor: AppColors.iconColor,
                    labelPadding: EdgeInsets.symmetric(vertical: 0),
                    dividerHeight: 0,tabs: [
                      Tab(text: "Desicription",),
                      Tab(text: "Company",),
                      Tab(text: "People",),
                    ]),
                    SizedBox(height: 24.h,),
                    Expanded(
                      child: TabBarView(children: [
                        Description(model: widget.model,),
                        Company(model: widget.model,),
                        People(),
                      ]),
                    )
                  ],
                ),
              ),
            ),
            FilledButton(
              onPressed: () {},
              child: Text("Apply now",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16)),
              style: FilledButton.styleFrom(
                  fixedSize: Size.fromHeight(48.h),
                  backgroundColor:  AppColors.buttonColor),
            ),
            SizedBox(height: 9,)
          ]
        ),
      ),
    );
  }
}
class _Item extends StatelessWidget {
  const _Item({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72.w,
      height: 26.h,
      child: FilledButton(onPressed: (){}, child: Text("data",
          style: TextStyle(color: AppColors.buttonColor,
              fontWeight: FontWeight.w400,
              fontSize: 12)),
        style: FilledButton.styleFrom(
          backgroundColor: Color(0xffD6E4FF),
          fixedSize: Size(72.w, 26.h),
        ),
      ),
    );
  }
}
