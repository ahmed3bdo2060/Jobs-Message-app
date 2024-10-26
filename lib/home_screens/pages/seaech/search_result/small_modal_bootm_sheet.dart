import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs/core/componnet/app_image.dart';

import '../../../../core/componnet/colors.dart';

class SmallModal extends StatefulWidget {
  const SmallModal({super.key});

  @override
  State<SmallModal> createState() => _SmallModalState();
}

class _SmallModalState extends State<SmallModal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 249,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(bottom: 9, top: 32, left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: AlignmentDirectional.center,
              child: Text(
                "On-Site/Remote",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 32,
            ),
            SizedBox(height: 36,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                  childAspectRatio: 34/80,
                  mainAxisSpacing: 8),
                  itemBuilder: (context, index) => Center(child: S2Item()),
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              ),
            ),
            Spacer(),
            FilledButton(
              onPressed: () {},
              child: Text("Show result",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16)),
              style: FilledButton.styleFrom(
                  fixedSize: Size.fromHeight(48.h),
                  backgroundColor:  AppColors.buttonColor),
            )
          ],
        ),
      ),
    );
  }
}

class S2Item extends StatefulWidget {
  const S2Item({
    super.key,
  });

  @override
  State<S2Item> createState() => S2ItemState();
}

class S2ItemState extends State<S2Item> {
  bool change = true;
  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
      onTap: () {
        change = !change;
        setState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: change == true ? Colors.white : Color(0xffD6E4FF),
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
              color: change == true
                  ? AppColors.unSelectedItem
                  : AppColors.selectedItem,
              width: 1.5),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Align(
            alignment: AlignmentDirectional.center,
            child: Text(
              "ahmed",
              style: TextStyle(
                  color: change?AppColors.iconColor:AppColors.buttonColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 12),
            ),
          ),
        ),
      ),
    );
  }
}