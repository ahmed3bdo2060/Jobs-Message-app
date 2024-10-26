import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs/core/componnet/app_image.dart';
import 'package:jobs/core/componnet/colors.dart';

import 'jobs.dart';

class homePageCommponnet2 extends StatefulWidget {
  const homePageCommponnet2({super.key, required this.model});
  final JobsModel model;
  @override
  State<homePageCommponnet2> createState() => _homePageCommponnet2State();
}

class _homePageCommponnet2State extends State<homePageCommponnet2> {
  bool change = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AppImage("${widget.model.image}",
                  width: 40,
                  hieght: 40,
                  fit: BoxFit.cover),
              SizedBox(width: 16.w,),
              Column(
                children: [
                  Text("${widget.model.name}}",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                      )),
                  Text("Zoom • United States",
                      style: TextStyle(
                          color: AppColors.iconColor
                      )),
                ],
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  change = !change;
                  setState(() {

                  });
                },
                child: AppImage(change==false?'assets/svg/archive-minus.svg':"assets/svg/boldarchive-minus.svg",
                    color: change?AppColors.buttonColor:Colors.black,
                    width: 24.w,
                    hieght: 24.h,
                    fit: BoxFit.cover),
              ),
            ],
          ),
          SizedBox(height: 16.h,),
          Row(
            mainAxisSize: MainAxisSize.max,
            children:[
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
              SizedBox(width: 4,),
              Spacer(),
              RichText(text: TextSpan(
                  children:[
                    TextSpan(
                      text: "\$ ${widget.model.salary}K",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff2E8E18)
                      ),
                    ),
                    TextSpan(
                        text: "/Month",
                        style: TextStyle(
                            color: AppColors.iconColor,
                            fontSize: 12
                        )
                    )
                  ]
              )),
            ]),
          SizedBox(height: 36.h,),

        ],
      ),

    );
  }
}
class _Item extends StatelessWidget {
  const _Item({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(width: 72.w,
        height: 26.h,child: Text("data",
    style: TextStyle(color: AppColors.buttonColor,
    fontWeight: FontWeight.w400,
    fontSize: 12)),
    );
  }
}
