import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs/core/logic/helper_methods.dart';
import 'package:jobs/home_screens/pages/seaech/search_result/search_results.dart';

import '../../../core/componnet/app_image.dart';
import '../../../core/componnet/colors.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 16.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(children: [
                AppImage(
                  "assets/images/arrow-left.png",
                  width: 24,
                  hieght: 24,
                ),
                SizedBox(
                  width: 12.w,
                ),
                Expanded(
                  child: TextFormField(
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus!.unfocus();
                    },
                    onTap: () {
                      navigateTo(SearchResultPage());
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
              ]),
            ),
            SizedBox(height: 22.h),
            Container(
              width: double.infinity,
              height: 36,
              alignment: AlignmentDirectional.centerStart,
              decoration: BoxDecoration(
                  color: Color(0xffF4F4F5),
                  border: Border.all(color: AppColors.borderColor, width: 1)),
              child: Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text("Recent searches",
                    style: TextStyle(color: AppColors.iconColor)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 24,),
              child: SizedBox(
                height: 250,
                child: ListView.builder(
                  itemBuilder: (context, index) => _Item(),
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              width: double.infinity,
              height: 36,
              alignment: AlignmentDirectional.centerStart,
              decoration: BoxDecoration(
                  color: Color(0xffF4F4F5),
                  border: Border.all(color: AppColors.borderColor, width: 1)),
              child: Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text("Popular searches",
                style: TextStyle(color: AppColors.iconColor)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 24,),
              child: SizedBox(
                height: 300,
                child: ListView.builder(
                  itemBuilder: (context, index) => _Item2(),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppImage(
          "assets/images/clock.png",
          width: 16.w,
          hieght: 16.h,
        ),
        SizedBox(
          width: 8.w,
        ),
        Text("data"),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: AppImage(
            "assets/images/close-circle.png",
            width: 22.w,
            hieght: 22.h,
          ),
        )
      ],
    );
  }
}
class _Item2 extends StatelessWidget {
  const _Item2({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppImage(
          "assets/svg/search-status.svg",
          width: 16.w,
          hieght: 16.h,
        ),
        SizedBox(
          width: 8.w,
        ),
        Text("data"),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_circle_right_outlined,
          color: AppColors.buttonColor,)
        )
      ],
    );
  }
}
