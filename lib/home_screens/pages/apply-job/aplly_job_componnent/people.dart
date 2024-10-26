import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs/core/componnet/colors.dart';

import '../../../../core/componnet/app_image.dart';

class People extends StatefulWidget {
  const People({super.key});

  @override
  State<People> createState() => _PeopleState();
}

class _PeopleState extends State<People> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text("6 Employees For"),
                Text("UI/UX Design",style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.iconColor
                )),
              ],),
              Container(
                height: 38.h,
                width: 139.w,
                constraints: BoxConstraints(maxHeight: 38.h,
                    maxWidth: 139.w),
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: AppColors.borderColor,),
                  shape: BoxShape.rectangle,
                ),
                child: Row(
                  children: [
                    Text("UI/UX Designer",style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14
                    ),),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        DropdownMenu(dropdownMenuEntries: [

                        ],);
                      },
                      child: AppImage("assets/svg/arrow-down.svg",width: 20,hieght: 20,
                        color: Colors.black,),
                    )
                  ],
                ),
              ),

            ],
          ),
          SizedBox(height: 20,),
          Text("About People",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),),
          SizedBox(height: 8.h,),
          Text("Understanding Recruitment is an award-winning technology, software and digital recruitment consultancy with headquarters in St. Albans, Hertfordshire.We also have a US office in Boston, Massachusetts specialising in working closely with highly skilled individuals seeking their next career move within Next Gen Tech, Backend Engineering, and Artificial Intelligence.We recently celebrated our first decade in business and over the years have been recognised with several industry awards including 'Best Staffing Firm to Work For 2018'​ at the SIA Awards for the third consecutive year and ‘Business of the Year 2017’ at the SME Hertfordshire Business Awards.Our teams of specialists operate across all areas of Technology and Digital, including Java, JavaScript, Python, .Net, DevOps & SRE, SDET, Artificial Intelligence, Machine Learning, AI, Digital, Quantum Computing, Hardware Acceleration, Digital, Charity, Fintech, and the Public Sector.",
              style: TextStyle(fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.iconColor)),
        ],
      ),
    );
  }
}
