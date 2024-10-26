import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs/core/componnet/app_image.dart';
import 'package:jobs/core/componnet/colors.dart';
import 'package:jobs/home_screens/pages/home_page/home_page_componnet.dart';

class SaveJob extends StatefulWidget {
  const SaveJob({super.key});

  @override
  State<SaveJob> createState() => _SaveJobState();
}

class _SaveJobState extends State<SaveJob> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Saved"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child:Column(children: [
          Text("${listOfWidgets.length} Job Saved",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.iconColor
              )),
          Expanded(
          child: listOfWidgets.isNotEmpty?ListView.builder(
              itemBuilder: (context, index) =>
              listOfWidgets[index],itemCount: listOfWidgets.length,
                   // _Item(),
          ):Padding(
            padding: EdgeInsets.only(top: 121,
              right: 37,left: 37,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: AppImage("assets/images/Saved Ilustration.png",
                    width: 173,fit: BoxFit.cover,),
                ),
                SizedBox(height: 24.h,),
                Text("Nothing has been saved yet",
                    textAlign: TextAlign.center,
                    style:  TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500
                    )),
                SizedBox(height: 12.h,),
                Text("Press the star icon on the job you want to save.",
                  textAlign: TextAlign.center,style: TextStyle(fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.iconColor),
                ),
              ],
            ),
          ),
        ),
    ])
      ),
    );
  }
}
class ItemOfSavedJobs extends StatefulWidget {
  const ItemOfSavedJobs({super.key});

  @override
  State<ItemOfSavedJobs> createState() => _ItemState();
}

class _ItemState extends State<ItemOfSavedJobs> {
  @override
  Widget build(BuildContext context) {
    return Padding(
       padding: EdgeInsets.only(bottom: 20.h),
      child: Container(
        padding: EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.borderColor))
        ),
        child: Column(
          children: [
            ListTile(
              onTap: () {

              },
              title: Text("Senior UI Designer",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                  )),
              subtitle: Text("Twitter • Jakarta, Indonesia ",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.iconColor
                  )),
              trailing: InkWell(
                onTap: () {
                  showModalBottomSheet(context: context, builder: (context) => Container(
                    width: 375.w,
                    height: 271,
                    child: Padding(
                      padding: EdgeInsets.only(left: 24,right: 24,top: 36),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {

                            },
                            child: Container(
                              height: 49,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                    color: AppColors.borderColor
                                ),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: 14.w,),
                                  AppImage("assets/images/directbox-notif.png",
                                  width: 20.w,hieght: 20.h,),
                                  SizedBox(width: 14.w,),
                                  Text("Apply Job",),
                                  Spacer(),
                                  Icon(Icons.arrow_forward_ios,size: 16,),
                                  SizedBox(width: 14.w,)
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 12.h,),
                          InkWell(onTap: () {

                          },
                            child: Container(
                              height: 49,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                    color: AppColors.borderColor
                                ),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: 14.w,),
                                  AppImage("assets/svg/export.svg",
                                    width: 20.w,hieght: 20.h,),
                                  SizedBox(width: 14.w,),
                                  Text("Share via...",),
                                  Spacer(),
                                  Icon(Icons.arrow_forward_ios,size: 16,),
                                  SizedBox(width: 14.w,)
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 12.h,),
                          InkWell(
                            onTap: () {
                              listOfWidgets.remove(ItemOfSavedJobs());
                            },
                            child: Container(
                              height: 49,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                    color: AppColors.borderColor
                                ),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: 14.w,),
                                  AppImage("assets/svg/archive-minus.svg",
                                    color: Colors.black,
                                    width: 20.w,hieght: 20.h,),
                                  SizedBox(width: 14.w,),
                                  Text("Cancel save",),
                                  Spacer(),
                                  Icon(Icons.arrow_forward_ios,size: 16,),
                                  SizedBox(width: 14.w,)
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),);
                },
                child: AppImage('assets/images/more.png',
                    hieght: 24,
                    width: 24),
              ),
              leading: AppImage('assets/images/Twitter Logo.png',
                  hieght: 40,
                  width: 40),
            ),
            SizedBox(height: 16.h,),
            Row(children: [
              Text("Posted 2 days ago",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.iconColor
                  )),
              Spacer(),
              Icon(Icons.timelapse,color: Color(0xff2E8E18),size: 12),
              SizedBox(width: 5,),
              Text("Be an early applicant",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.iconColor
                  )),
            ],)
          ],
        ),
      ),
    );
  }
}
