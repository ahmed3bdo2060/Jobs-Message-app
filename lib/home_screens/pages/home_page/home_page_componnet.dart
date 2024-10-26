import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs/core/componnet/app_image.dart';
import 'package:jobs/core/componnet/colors.dart';
import 'package:jobs/core/logic/helper_methods.dart';
import 'package:jobs/home_screens/pages/home_page/jobs.dart';
import 'package:jobs/home_screens/pages/saved/save_job.dart';

import '../apply-job/apply_job.dart';

class homePageCommponnet extends StatefulWidget {
  const homePageCommponnet({super.key, required this.model});
  final JobsModel model;


  @override
  State<homePageCommponnet> createState() => _homePageCommponnetState();
}

class _homePageCommponnetState extends State<homePageCommponnet> {
  bool change = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16),
      child: Container(
        width: 300.w,
        height: 183.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: AppColors.darkBlue
        ),
        child: Column(
          children: [
            ListTile(
              trailing: GestureDetector(
                onTap: () {
                  change = !change;
                  listOfWidgets.add(ItemOfSavedJobs());
                  setState(() {

                  });
                },
                child: AppImage('assets/svg/archive-minus.svg',
                color: change ?Colors.white:AppColors.buttonColor,
                width: 24,
                hieght: 24,
                fit: BoxFit.cover),
              ),
              leading: AppImage("${widget.model.image}",
              width: 40,
              hieght: 40,
              fit: BoxFit.cover),
              title: Text("${widget.model.name}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500
              )),
              subtitle: Text("Zoom • United States",
               style: TextStyle(
                 color: AppColors.iconColor
               )),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:
                  [
                    Container(

                      padding: EdgeInsets.symmetric(horizontal: 23.w,vertical: 6.h),
                      decoration: BoxDecoration(
                        color: Color(0xffFFFFFF).withOpacity(.14),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Text("${widget.model.jobTimeType}",
                      style: TextStyle(color: Colors.white,
                      fontSize: 10)),
                    ),
                    SizedBox(width: 4,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 23.w,vertical: 6.h),
                      decoration: BoxDecoration(
                        color: Color(0xffFFFFFF).withOpacity(.14),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Text("Remote",
                          style: TextStyle(color: Colors.white,
                          fontSize: 10)),
                    ),
                    SizedBox(width: 4,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 23.w,vertical: 6.h),
                      decoration: BoxDecoration(
                        color: Color(0xffFFFFFF).withOpacity(.14),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Text("${widget.model.jobType}",
                          style: TextStyle(color: Colors.white,
                          fontSize: 10),
                      ),
                    )
                  ]
              ),
            ),
            SizedBox(height: 10.h,),
           Padding(
             padding: EdgeInsets.symmetric(horizontal: 16.w),
             child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
               RichText(text: TextSpan(
                   children:[
                     TextSpan(
                       text: "\$ ${widget.model.salary}K",
                       style: TextStyle(
                         fontSize: 20,
                           color: Colors.white
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
                SizedBox(
                  height: 32.h,
                  width: 100.w,
                  child: FilledButton(onPressed: () {
                    navigateTo(JobDetails(model: widget.model,));
                  }, child:Text("Apply now",
                  style: TextStyle(color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),),
                  style: FilledButton.styleFrom(
                    fixedSize: Size(110.w, 32.h),
                    backgroundColor: AppColors.buttonColor
                  ),),
                )
             ],
             ),
           ),
          ],
        ),

      ),
    );
  }
}
class _Item extends StatelessWidget {
  const _Item({super.key, required this.model});
  final JobsModel model;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 87.w,
      height: 30.h,
      child: FilledButton(onPressed: (){}, child: Text("${model.jobTimeType}",
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 10
      )),
        style: FilledButton.styleFrom(
          backgroundColor: Color(0xffFFFFFF).withOpacity(.14),
          fixedSize: Size(87.w, 30.h)
        ),
      ),
    );
  }
}
List<Widget> listOfWidgets = [];