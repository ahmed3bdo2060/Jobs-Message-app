import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get_it/get_it.dart';
import 'package:jobs/auth/create_account/fourth_page/create_account_fourth_view.dart';
import 'package:jobs/auth/create_account/second_page/model.dart';
import 'package:jobs/auth/create_account/third_page/bloc.dart';
import 'package:jobs/auth/create_account/third_page/events.dart';
import 'package:jobs/auth/create_account/third_page/item.dart';
import 'package:jobs/auth/create_account/third_page/model.dart';
import 'package:jobs/auth/create_account/third_page/states.dart';
import 'package:jobs/core/componnet/colors.dart';
import 'package:jobs/core/logic/helper_methods.dart';

import '../../../core/componnet/app_image.dart';
import '../../../core/componnet/app_loading.dart';

class CreateAccountThirdView extends StatefulWidget {
  const CreateAccountThirdView({super.key});

  @override
  State<CreateAccountThirdView> createState() => _CreateAccountThirdViewState();
}

class _CreateAccountThirdViewState extends State<CreateAccountThirdView> {
  final bloc = GetIt.I<ThirdCreateBloc>();
  late final ContriesModel? model;
  late final bool selected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w).copyWith(top: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Where are you prefefred Location?",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Container(
                  padding: EdgeInsets.only(right: 50),
                  child: Text(
                    "Let us know, where is the work location you want at this time, so we can adjust it.",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.iconColor),
                  ),
                ),
                SizedBox(
                  height: 32.h,
                ),
                TabBar(
                  tabs: [
                    Tab(
                      text: "Work From Office",
                    ),
                    Tab(
                      text: "Remote Work",
                    )
                  ],
                  unselectedLabelColor: AppColors.iconColor,
                  labelColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  indicatorPadding:
                      EdgeInsets.symmetric(horizontal: -30, vertical: 5),
                  dividerHeight: 0,
                  indicator: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(100.r),
                    color: AppColors.darkBlue,
                  ),
                ),
                Expanded(
                    child: TabBarView(children: [
                      Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "Select the country you want for your job",
                          style: TextStyle(color: AppColors.iconColor),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Expanded(
                            child:
                            Wrap(
                              children: List.generate(contries.length,
                                      (index) => Item(model: contries[index], callback: (model ,isSelected  ) {
                                        if(isSelected){
                                          bloc.add(ThirdCreateAddOflineEvent(model));
                                        }else{
                                          bloc.add(ThirdCreateRemoveOflineEvent(model));
                                        }
                                      },)),
                              spacing: 12,
                              runSpacing: 16,)
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "Select the country you want for your job",
                          style: TextStyle(color: AppColors.iconColor),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Expanded(
                            child:
                            // StaggeredGrid.count(crossAxisCount: 4,crossAxisSpacing: 4
                            //   ,mainAxisSpacing: 4,
                            // children: [
                            //   StaggeredGridTile.count(crossAxisCellCount: 2, mainAxisCellCount: 1, child: Item(model: ContriesModel[index]))
                            // ],)
                            Wrap(
                              children: List.generate(contries.length,
                                      (index) => Item(model: contries[index], callback: (model , isSelected ) {
                                        if(isSelected){
                                          bloc.add(ThirdCreateAddRemoteEvent(model));
                                        }else{
                                          bloc.add(ThirdCreateRemoveRemoteEvent(model));
                                        }
                                      },)),
                              spacing: 12,
                              runSpacing: 16,)
                        ),
                      ],
                    )
                ])),
                SizedBox(
                  height: 66.h,
                ),
                BlocConsumer(
                  bloc: bloc,
                  builder: (context, state) {
                    if(state is ThirdCreateSuccessEvent){
                      return FilledButton(
                        onPressed: () {
                          bloc.add(ThirdCreateEvent());
                          navigateTo(CreateAccountThirdView());
                        },
                        child: Text("Next",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16)),
                        style: FilledButton.styleFrom(
                            fixedSize: Size.fromHeight(48.h),
                            backgroundColor: AppColors.buttonColor),
                      );
                    }
                    else if(state is ThirdCreateLoadingState){
                      return AppLoading();
                    }else{
                      return FilledButton(
                        onPressed: () {
                          bloc.add(ThirdCreateEvent());
                          navigateTo(CreateAccountFourthView());
                        },
                        child: Text("Next",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16)),
                        style: FilledButton.styleFrom(
                            fixedSize: Size.fromHeight(48.h),
                            backgroundColor: AppColors.buttonColor),
                      );
                    }
                  },
                  listener:(context, state) {
                  },
                ),
                SizedBox(
                  height: 9,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
