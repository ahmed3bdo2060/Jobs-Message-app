import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs/auth/create_account/create_account.dart';
import 'package:jobs/core/componnet/colors.dart';
import 'package:jobs/onboarding/onboarding_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../core/logic/helper_methods.dart';
import '../splash/splash.dart';
int page = 1;

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          title: Image.asset(
            "assets/images/splash logo.png",
            height: 19.h,
            width: 81.w,
            fit: BoxFit.cover,
          ),
          actions: [
            TextButton(
              onPressed: () {
                navigateTo(CreateAccountView());
              },
              child: Text(
                "Skip",
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.descText),
              ),
            ),
          ]),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: PageView.builder(
              itemBuilder: (context, index) =>
                  OnBoardWidget(model: onBoardingList[index]),
              controller: controller,
              itemCount: onBoardingList.length,
              scrollDirection: Axis.horizontal,
              onPageChanged: (value) {
               page=value+1;
               setState(() {

               });
              },
            ),
          ),
          Align(
              alignment: AlignmentDirectional.center,
              child: SmoothPageIndicator(
                controller: controller,
                count: onBoardingList.length,
                effect: SlideEffect(
                  activeDotColor: AppColors.buttonColor,
                  dotHeight: 8.h,
                  dotWidth: 8.w,
                  spacing: 3.w,

                ),
              )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: FilledButton(
              onPressed: () {
                if (page < onBoardingList.length) {
                  controller.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.linear,
                  );
                  page++;
                } else {
                  navigateTo(SpalshView());
                }
                setState(() {});
              },
              child: page == onBoardingList.length
                  ? Text(
                      "Get Started",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp),
                    )
                  : Text(
                      "Next",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp),
                    ),
              style: FilledButton.styleFrom(
                  fixedSize: Size.fromHeight(48.h),
                  backgroundColor:AppColors.buttonColor),
            ),
          )
        ],
      ),
    );
  }
}

class OnBoardWidget extends StatelessWidget {
  final OnBoardingModel model;

  const OnBoardWidget({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          model.img,
          height: 424.h,
          width: 375.w,
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: 36.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: model.title1,
                  style: TextStyle(
                    fontSize: 32.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontFamily: "ABeeZeeRegular",
                  )),
              TextSpan(
                text: model.title2,
                style: TextStyle(
                  fontSize: 32.sp,
                  color:page==onBoardingList.length-1?Colors.black:AppColors.buttonColor,
                  fontWeight: FontWeight.w500,
                  fontFamily: "ABeeZeeRegular",
                ),
              ),
              TextSpan(
                  text: model.title3,
                  style: TextStyle(
                    fontSize: 32.sp,
                    color: page==onBoardingList.length-1?AppColors.buttonColor:Colors.black,
                    fontWeight: FontWeight.w500,
                    fontFamily: "ABeeZeeRegular",
                  )),
            ]),
          ),
        ),
        SizedBox(
          height: 26.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(
            model.desc,
            style: TextStyle(
              fontFamily: 'ABeeZeeRegular',
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
              color: AppColors.descText,
            ),
          ),
        )
      ],
    );
  }
}
