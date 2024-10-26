import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs/home_screens/pages/seaech/search_result/search_results.dart';

import '../../../../core/componnet/app_image.dart';
import '../../../../core/componnet/colors.dart';

class ModalBottomSheet extends StatelessWidget {
  const ModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 758.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
          BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 24, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment
              .stretch,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: AppImage(
                    "assets/images/arrow-left.png",
                    width: 24,
                    hieght: 24,
                  ),
                ),
                Text(
                  "Set Filter",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight
                          .w500),
                ),
                GestureDetector(
                  child: Text(
                    "Reset",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight
                            .w500,
                        color: AppColors
                            .buttonColor),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 28.h,
            ),
            Text(
              "Job Tittle",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8.h,),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius
                        .circular(8),
                  ),
                  constraints: BoxConstraints(
                      maxHeight: 56.h),
                  prefix: Padding(
                      padding: EdgeInsets.only(
                          left: 12)),
                  prefixIconConstraints: BoxConstraints(
                      minHeight: 20,
                      minWidth: 20,
                      maxWidth: 40,
                      maxHeight: 40
                  ),
                  contentPadding: EdgeInsets.only(
                      left: 20, top: 18,
                      bottom: 18),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(
                        left: 12),
                    child: AppImage(
                        "assets/svg/briefcase.svg",
                        width: 20,
                        color: Colors.black,
                        hieght: 20,
                        fit: BoxFit.cover),
                  )
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              "Location",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8.h,),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius
                        .circular(8),
                  ),
                  constraints: BoxConstraints(
                      maxHeight: 56.h),
                  prefix: Padding(
                      padding: EdgeInsets.only(
                          left: 12)),
                  prefixIconConstraints: BoxConstraints(
                      minHeight: 20,
                      minWidth: 20,
                      maxWidth: 40,
                      maxHeight: 40
                  ),
                  contentPadding: EdgeInsets.only(
                      left: 20, top: 18,
                      bottom: 18),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(
                        left: 12),
                    child: AppImage(
                        "assets/svg/location.svg",
                        width: 20,
                        hieght: 20,
                        fit: BoxFit.cover),
                  )
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              "Salary",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8.h,),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius
                        .circular(8),
                  ),
                  constraints: BoxConstraints(
                      maxHeight: 56.h),
                  suffixIconConstraints:BoxConstraints(
                      minHeight: 20,
                      minWidth: 20,
                      maxWidth: 40,
                      maxHeight: 40
                  ),
                  suffixIcon: InkWell(
                    onTap: () {
                      DropdownMenuItem(
                          child: ListView.builder(
                             itemCount: 6, itemBuilder:
                                  (context, index) => Text('data'),));
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: AppImage("assets/svg/arrow-down.svg",
                          hieght:20,
                      width: 20,
                       color: Colors.black,
                      fit: BoxFit.cover),
                    ),
                  ),
                  prefix: Padding(
                      padding: EdgeInsets.only(
                          left: 12)),
                  prefixIconConstraints: BoxConstraints(
                      minHeight: 20,
                      minWidth: 20,
                      maxWidth: 40,
                      maxHeight: 40
                  ),
                  contentPadding: EdgeInsets.only(
                      left: 20, top: 18,
                      bottom: 18),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(
                        left: 12),
                    child: AppImage(
                        "assets/svg/dollar-circle.svg",
                        width: 20,
                        hieght: 20,
                        fit: BoxFit.cover),
                  )
              ),
            ),
            SizedBox(height: 12,),
            Container(
              height: 56,
              width: double.infinity,
              constraints: BoxConstraints(maxHeight: 56,
              maxWidth: double.infinity),
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.borderColor,),
                shape: BoxShape.rectangle,
              ),
              child: Row(
                children: [
                  AppImage("assets/svg/dollar-circle.svg",
                  width: 20,hieght: 20,),
                  SizedBox(width: 12,),
                  Text("Ahmed",style: TextStyle(
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
            SizedBox(height: 16.h,),
            Text(
              "Job Type",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 12,),
            SizedBox(
              height: 120.h,
              width: double.infinity,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 16,
                    childAspectRatio: 91 / 34
                ),
                itemBuilder: (context, index) =>
                    SItem(),
                itemCount: 6,),
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
class SItem extends StatefulWidget {
  const SItem({super.key,});

  @override
  State<SItem> createState() => SItemState();
}

class SItemState extends State<SItem> {
  bool change = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
          padding: EdgeInsets.symmetric(horizontal: 20,
          vertical: 8),
          child: Align(
            alignment: AlignmentDirectional.center,
            child: Text(
              "ahmed",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
final FakeList=[
  "ahmed",
  "ahmed",
  "ahmed",
  "ahmed",
  "ahmed",
  "ahmed",
];