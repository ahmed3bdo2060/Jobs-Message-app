import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/componnet/app_image.dart';
import '../../../core/componnet/colors.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification"),
        centerTitle: true,
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child:Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text("New",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.iconColor
                )),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => _Item(),),
            ),
          ])
      ),

    );
  }
}
class _Item extends StatefulWidget {
  const _Item({super.key});

  @override
  State<_Item> createState() => _ItemState();
}

class _ItemState extends State<_Item> {
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
                child: CircleAvatar(backgroundColor: Color(0xffDBB40E),
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