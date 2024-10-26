import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:jobs/auth/create_account/second_page/events.dart';
import 'package:jobs/auth/create_account/second_page/model.dart';
import 'package:jobs/auth/create_account/second_page/states.dart';
import 'package:jobs/auth/create_account/third_page/create_account_Third_view.dart';
import 'package:jobs/core/componnet/app_loading.dart';
import 'package:jobs/core/componnet/colors.dart';
import 'package:jobs/core/logic/helper_methods.dart';

import '../../../core/componnet/app_image.dart';
import 'bloc.dart';

class CreateAccountSecondView extends StatefulWidget {
  const CreateAccountSecondView({super.key});

  @override
  State<CreateAccountSecondView> createState() =>
      _CreateAccountSecondViewState();
}

class _CreateAccountSecondViewState extends State<CreateAccountSecondView> {
  final bloc = GetIt.I<SecondCreateBloc>();
    late final WorkTypesModel? model;
    late final bool selected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w).copyWith(top: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "What type of work are you interested in?",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                "Tell us what you’re interested in so we can customise the app for your needs.",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.iconColor),
              ),
              SizedBox(
                height: 36.h,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20.h,
                      childAspectRatio: 156 / 126,
                      crossAxisSpacing: 15.w),
                  itemBuilder: (context, index) =>
                      _item(model: workType[index],callback: (model,isSelected){
                        if(isSelected) {
                          bloc.add(SecondCreateAddEvent(model));
                        }else{
                          bloc.add(SecondCreateRemoveEvent(model));
                        }
                      },),
                  itemCount: workType.length,
                ),
              ),
             SizedBox(
               height: 66.h,
             ),
          BlocConsumer(
            bloc: bloc,
            builder: (context, state) {
              if(state is SecondCreateSuccessState){
                return FilledButton(
                  onPressed: () {
                    bloc.add(SecondCreateEvent());
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
              else if(state is SecondCreateLoadingState){
                return AppLoading();
              }else{
               return FilledButton(
                  onPressed: () {
                    bloc.add(SecondCreateEvent());
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
            },
            listener:(context, state) {
            },
          ),
              SizedBox(height: 9,)
            ],
          ),
        ),
      ),
    );
  }
}

class _item extends StatefulWidget {
   _item({super.key, required this.model, required this.callback});

  final WorkTypesModel model;
  final  void Function(WorkTypesModel,bool) callback;
  @override
  State<_item> createState() => _itemState();
}

class _itemState extends State<_item> {
  bool change = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        change = !change;
        widget.callback(widget.model,change == false);
        setState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
          color: change == true ? Colors.white : Color(0xffD6E4FF),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: change == true
                  ? AppColors.unSelectedItem
                  : AppColors.selectedItem,
              width: 1.5),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 20, left: 14),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 14),
                        blurRadius: 50,
                        color: Color(0xff0F172A).withOpacity(.12))
                  ],
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                      color: change == true
                          ? AppColors.unSelectedItem
                          : AppColors.selectedItem),
                  color: Colors.white),
              child: Center(
                child: AppImage(
                  widget.model.image,
                  width: 24,
                  hieght: 24,
                  color: change == true ? Colors.black : AppColors.buttonColor,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              widget.model.job,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
            )
          ]),
        ),
      ),
    );
  }
}
