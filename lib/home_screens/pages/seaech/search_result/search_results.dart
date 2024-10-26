import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs/auth/create_account/third_page/item.dart';
import 'package:jobs/core/componnet/app_input.dart';
import 'package:jobs/home_screens/pages/seaech/search_result/small_modal_bootm_sheet.dart';
import '../../../../core/componnet/app_image.dart';
import '../../../../core/componnet/colors.dart';
import '../../home_page/home_page_componnet2.dart';
import 'Modal_bottom_sheets.dart';

class SearchResultPage extends StatefulWidget {
  const SearchResultPage({super.key});

  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  void modalBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => ModalBottomSheet(),
    );
  }
bool result = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      extendBodyBehindAppBar: true,
      body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                    onTap: () {},
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
                      suffixIcon: GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.only(right: 14),
                          child: AppImage(
                            "assets/svg/close-circle.svg",
                            width: 20.w,
                            hieght: 20.h,
                          ),
                        ),
                      ),
                      suffixIconConstraints: BoxConstraints(
                        maxHeight: 44,
                        minHeight: 20,
                        minWidth: 20,
                        maxWidth: 44,
                      ),
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
            SizedBox(
              height: 22.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                      onPressed: () {
                        modalBottomSheet();
                      },
                      icon: AppImage(
                        "assets/images/search_setting-4.png",
                        width: 24.w,
                        hieght: 24.h,
                      )),
                  SizedBox(
                    width: 16.w,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 34,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => _Item(),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 28,
            ),
            Padding(
             padding: EdgeInsets.symmetric(horizontal: 24.w),
             child: Text(
               "Featuring 120+ jobs",
               style: TextStyle(color: AppColors.iconColor),
             ),
           ),
            SizedBox(
              height: 25,
            ),
          result==true?Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: ListView.builder(
                  itemBuilder: (context, index) => Text("data")
                      // homePageCommponnet2(),
                ),
              )
            ):Padding(
            padding: EdgeInsets.only(top: 116.h,right: 51.w,left: 51.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [ AppImage(
                  "assets/images/emptySearch Ilustration.png",
                  width: 173.w,
                  hieght: 100.h,),
                    SizedBox(height: 24.h,),
                    Text("Search not found",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22,
                    fontWeight: FontWeight.w500)),
                    Text("Try searching with different keywords so we can show you",
                    style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.iconColor),
                    textAlign: TextAlign.center,)
                ]),
              ),
            ),
          ]),
    ));
  }
}

class _Item extends StatefulWidget {
  const _Item({super.key});

  @override
  State<_Item> createState() => _ItemState();
}

class _ItemState extends State<_Item> {
  void smallmodalBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => SmallModal(),
    );
  }

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8),
      child: Container(
        height: 32,
        constraints: BoxConstraints(
          maxHeight: 32,
        ),
        padding: EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: AppColors.borderColor,
          ),
          shape: BoxShape.rectangle,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Ahmed",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
            SizedBox(
              width: 4,
            ),
            InkWell(
              onTap: () {
                smallmodalBottomSheet();
              },
              child: AppImage(
                "assets/svg/arrow-down.svg",
                width: 20,
                hieght: 20,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
