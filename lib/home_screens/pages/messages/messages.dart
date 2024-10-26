import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/componnet/app_image.dart';
import '../../../core/componnet/colors.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  bool noMessage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Messsages"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w).copyWith(top: 24.h),
        child: Column(
          children: [
            Row(children: [
              Expanded(
                child: TextFormField(
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus!.unfocus();
                  },
                  onTap: () {
                  },
                  decoration: InputDecoration(
                    constraints: BoxConstraints(maxHeight: 48.h),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.r),
                        borderSide: BorderSide(color: AppColors.borderColor)),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.r)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.r),
                        borderSide: BorderSide(
                          color: AppColors.borderColor,
                        )),
                    hintText: 'Search....',
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                    prefix: Padding(padding: EdgeInsets.only(left: 12)),
                    prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: AppImage("assets/images/search-normal.png",
                            hieght: 20, width: 20, fit: BoxFit.cover)),
                    prefixIconConstraints: BoxConstraints(
                      maxHeight: 44,
                      minHeight: 20,
                      minWidth: 20,
                      maxWidth: 44,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w,),
              InkWell(
                onTap: () {
                  showModalBottomSheet(context: context, builder: (context) => Container(
                    width: 375.w,
                    height: 309,
                    child: Padding(
                      padding: EdgeInsets.only(left: 24,right: 24,top: 36),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Message filters",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18
                          )),
                          SizedBox(
                            height: 16.h,
                          ),
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
                                  Text("Unread",),
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
                                  Text("Spam",),
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
                                  Text("Archived",),
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
                child: Container(child: Center(
                  child: AppImage("assets/images/search_setting-4.png",
                  width: 24.w,
                  hieght: 24.h,),
                ),
                width: 48.w,
                height: 48.h,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.borderColor),
                  borderRadius: BorderRadius.circular(100)
                ),),
              )
            ],),
            SizedBox(height: 28,),
           Expanded(
              child:noMessage== false ? ListView.builder(
                itemBuilder: (context, index) => _Item(),):Padding(
                padding: EdgeInsets.only(top: 121,
                  right: 37,left: 37,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: AppImage("assets/images/nomessage.png",
                        width: 173,fit: BoxFit.cover,),
                    ),
                    SizedBox(height: 24.h,),
                    Text("You have not received any messages",
                        textAlign: TextAlign.center,
                        style:  TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500
                        )),
                    SizedBox(height: 12.h,),
                    Text("Once your application has reached the interview stage, you will get a message from the recruiter.",
                      textAlign: TextAlign.center,style: TextStyle(fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.iconColor),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
class _Item extends StatefulWidget {
  const _Item({super.key});

  @override
  State<_Item> createState() => _ItemState();
}

class _ItemState extends State<_Item> {
  bool onChane = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 20.h),
        child: Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: AppColors.borderColor))
          ),
          child: ListTile(
            onTap: () {
              onChane =! onChane;
              setState(() {

              });
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
            leading: AppImage('assets/images/Twitter Logo.png',
                hieght: 40,
                width: 40),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 8.h,
                  width: 8.w,
                  child: CircleAvatar(backgroundColor:onChane==false? Color(0xffDBB40E):Colors.green,
                  ),
                ),
                SizedBox(width: 8.w,),
                Text("10.00AM",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.iconColor
                    )),
              ],
            ),
          ),
        )
    );
  }
}
