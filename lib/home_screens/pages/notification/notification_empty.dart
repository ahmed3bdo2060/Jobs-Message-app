import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/componnet/app_image.dart';
import '../../../core/componnet/colors.dart';

class NotificationsEmpty extends StatefulWidget {
  const NotificationsEmpty({super.key});

  @override
  State<NotificationsEmpty> createState() => _NotificationsEmptyState();
}

class _NotificationsEmptyState extends State<NotificationsEmpty> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 121,
          right: 37,left: 37,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: AppImage("assets/images/Notification Ilustration (1).png",
                width: 173,fit: BoxFit.cover,),
            ),
            SizedBox(height: 24.h,),
            Text("No new notifications yet",
                textAlign: TextAlign.center,
                style:  TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500
                )),
            SizedBox(height: 12.h,),
            Text("You will receive a notification if there is something on your account",
              textAlign: TextAlign.center,style: TextStyle(fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.iconColor),
            ),
          ],
        ),
      ),
    );
  }
}
