import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs/core/componnet/colors.dart';
import 'package:jobs/home_screens/pages/home_page/jobs.dart';

class Description extends StatefulWidget {
  const Description({super.key, required this.model});
  final JobsModel model;

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Job Description",
          style: TextStyle(
            fontSize: 14,
             fontWeight: FontWeight.w500,
          ),),
          SizedBox(height: 8.h,),
          Text("${widget.model.jobDescription}",
          style: TextStyle(fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.iconColor)),
          SizedBox(height: 20,),
          Text("Skill Required",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),),
          SizedBox(height: 8.h,),
          Text("${widget.model.jobSkill}",
              style: TextStyle(fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.iconColor)),
        ],
      ),
    );
  }
}
