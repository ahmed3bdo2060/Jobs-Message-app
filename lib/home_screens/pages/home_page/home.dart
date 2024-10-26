import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:jobs/core/componnet/app_failed.dart';
import 'package:jobs/core/componnet/app_image.dart';
import 'package:jobs/core/componnet/app_input.dart';
import 'package:jobs/core/componnet/colors.dart';
import 'package:jobs/core/logic/cash_helper.dart';
import 'package:jobs/core/logic/helper_methods.dart';
import 'package:jobs/home_screens/pages/home_page/jobs.dart';
import 'package:jobs/home_screens/pages/home_page/states.dart';

import '../seaech/search_page.dart';
import 'bloc.dart';
import 'home_page_componnet.dart';
import 'home_page_componnet2.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});
  @override
  State<HomeScreenPage> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenPage> {
  final bloc = GetIt.I<HomePageBloc>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16.h,),
            Text("Hi, ${CashHelper.userName}👋",
              style:  TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 24
              )),
          Text("Create a better future for yourself here",
              style: TextStyle(color: AppColors.iconColor,
              fontSize: 12)),
                    ],
                  ),
          Spacer(),
          IconButton(onPressed: (){}, icon:AppImage("assets/images/Notification (1).png",
              width: 48.w,hieght: 48.h,),),
                ],
              ),
              SizedBox(height: 28.h,),
             TextFormField(
               onTapOutside: (event) {
                 FocusManager.instance.primaryFocus!.unfocus();
               },
               onTap: () {
                 navigateTo(SearchPage());
               },
               decoration: InputDecoration(
                 constraints: BoxConstraints(
                   maxHeight: 48.h
                 ),
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(100.r),
                 ),
                 enabledBorder: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(100.r),
                   borderSide: BorderSide(
                     color: AppColors.borderColor
                   )
                 ),
                 disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.r)),
                 focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.r),
                 borderSide: BorderSide(
                   color: AppColors.borderColor,
                 )),
                 hintText: 'Search....',
                 contentPadding: EdgeInsets.symmetric(horizontal: 12,
                 vertical: 14),
                 prefix: Padding(padding: EdgeInsets.only(left: 12)) ,
                 prefixIcon:
                 Padding(padding: EdgeInsets.only(left: 12),child: AppImage(
                   "assets/images/search-normal.png",
                   hieght: 20,
                   width: 20,
                 fit: BoxFit.cover)),
                 prefixIconConstraints: BoxConstraints(
                   maxHeight: 44,
                   minHeight: 20,
                   minWidth: 20,
                   maxWidth: 44,
                 ),
               ),
             ),
              SizedBox(height: 20.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Suggested Job",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),),
                  TextButton(onPressed: () {},
                      child:Text("View all",
                      style: TextStyle(color: AppColors.buttonColor),) ),
                ],
              ),
             SizedBox(height: 10,),
             SizedBox(
               height: 160.h,
               child: BlocConsumer(
                 bloc: bloc,
                 builder: (context, state) {
                   if(state is HomePageSuccessState){
                     return ListView.builder(
                         itemCount: state.list.length,
                         scrollDirection: Axis.horizontal,
                         itemBuilder:(context, index) =>  homePageCommponnet(model: state.list[index],));
                   }else if(state is HomePageFailedState){
                     return AppFailed(msg: state.msg!, onPress: () {
                     },);
                   }else{
                    return ListView.builder(
                        itemCount: 2,
                        scrollDirection: Axis.horizontal,
                        itemBuilder:(context, index) =>  Text("data"));
                   }
                 },listener: (context, state) {

                 },
               ),
             ),
              SizedBox(height: 24,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Recent Job",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),),
                  TextButton(onPressed: () {},
                      child:Text("View all",
                        style: TextStyle(color: AppColors.buttonColor),) ),
                ],
              ),
              SizedBox(height: 10.h,),
              Expanded(child:
              BlocConsumer(bloc: bloc,
                  builder: (context, state) {
                    if(state is HomePageSuccessState){
                      return ListView.builder( itemBuilder: (context, index) => homePageCommponnet2(model: state.list[index]),
                        itemCount: state.list.length,
                        );
                    }
                    else if(state is HomePageFailedState){
                     return AppFailed(msg: state.msg!, onPress: () {},);
                    }else{
                      return Text("data");
                    }
                  },listener: (context, state) {

                  },
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
