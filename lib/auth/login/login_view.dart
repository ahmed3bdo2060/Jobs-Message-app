import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:jobs/auth/create_account/bloc.dart';
import 'package:jobs/auth/create_account/create_account.dart';
import 'package:jobs/auth/create_account/events.dart';
import 'package:jobs/auth/create_account/second_page/create_account_second_view.dart';
import 'package:jobs/auth/create_account/state.dart';
import 'package:jobs/auth/login/state.dart';
import 'package:jobs/core/componnet/app_failed.dart';
import 'package:jobs/core/componnet/app_loading.dart';
import 'package:jobs/core/componnet/colors.dart';
import 'package:jobs/core/componnet/validator.dart';
import 'package:jobs/core/logic/cash_helper.dart';
import 'package:jobs/core/logic/helper_methods.dart';
import '../../core/componnet/app_image.dart';
import '../../core/componnet/app_input.dart';
import '../../core/componnet/app_theme.dart';
import '../../home_screens/pages/home_page/home.dart';
import '../resset_password/resset_password_view.dart';
import 'bloc.dart';
import 'events.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final bloc = GetIt.I<LoginBloc>();
  bool? check=false ;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.emailController.text = CashHelper.saveEmail;
    bloc.passwordController.text = CashHelper.savesetPassword;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 24.w),
              child: AppImage(
                "assets/images/splash logo.png",
                hieght: 19.h,
                width: 81.w,
                fit: BoxFit.cover,
              ))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w).copyWith(top: 41.h),
        child: Align(
          alignment: AlignmentDirectional.bottomCenter,
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Please login to find your dream job",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: AppColors.descText),
                  ),
                  SizedBox(
                    height: 44.h,
                  ),
                  AppInput(
                    onChange: (p0) {
                      setState(() {});
                    },
                    hint: "Email",
                    controller: bloc.emailController,
                    prefixIcon: "assets/svg/sms.svg",
                  ),
                  SizedBox(height: 16.h),
                  AppInput(
                    hint: "Password",
                    isPassword: true,
                    validate: (value) => InputValidator.password(value),
                    onChange: (p0) {
                      setState(() {});
                    },
                    controller: bloc.passwordController,
                    inputType: InputType.password,
                    prefixIcon: "assets/svg/lock.svg",
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: check,
                        side: BorderSide(color: AppColors.borderColor),
                        activeColor: AppColors.buttonColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: BorderSide(
                              color: AppColors.borderColor,
                            )),
                        onChanged: (value) {
                          check = value;
                          setState(() {
                          });
                        },
                      ),
                      Text("Remember me"),
                      Spacer(),
                      TextButton(
                          onPressed: () {
                            navigateTo(ResetPasswordView());
                          },
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: AppColors.buttonColor,
                            ),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 160.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Dont’t have an account?",
                        style: TextStyle(
                          color: AppColors.iconColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          navigateTo(CreateAccountView(), keepHistory: false);
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: AppColors.buttonColor),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  BlocConsumer(
                    bloc: bloc,
                    builder: (context, state) {
                       if (state is LoginLoadingState) {
                        return AppLoading();
                      } else if(state is LoginFailedState){
                        return  FilledButton(
                          onPressed: () {
                            bloc.add(LoginEvent());
                          },
                          child: Text("Login",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16)),
                          style: FilledButton.styleFrom(
                              fixedSize: Size.fromHeight(48.h),
                              backgroundColor:
                              bloc.passwordController.text.isEmpty ||
                                  bloc.emailController.text.isEmpty
                                  ? AppColors.borderColor
                                  : AppColors.buttonColor),
                        );
                      }else{
                        return
                          FilledButton(
                            onPressed: () {
                              bloc.add(LoginEvent());
                            },
                            child: Text("Login",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16)),
                            style: FilledButton.styleFrom(
                                fixedSize: Size.fromHeight(48.h),
                                backgroundColor:
                                bloc.passwordController.text.isEmpty ||
                                    bloc.emailController.text.isEmpty
                                    ? AppColors.borderColor
                                    : AppColors.buttonColor),
                          );
                      }
                    },listener: (context, state) {
                      if(state is LoginSuccessState){
                        showMessage("success",messageType: MessageType.Success);
                        if(check==true){
                          CashHelper.setSaveEmail(bloc.emailController.text);
                          CashHelper.setPassword(bloc.passwordController.text);
                          navigateTo(HomeScreenPage());
                        }else{
                          check=CashHelper.isNotFirstTime;
                          bloc.emailController.text= CashHelper.getRemove();
                          bloc.passwordController.text=CashHelper.getRemovepassword();
                          setState(() {

                          });
                        }
                      }else if(state is LoginFailedState){
                        showMessage(state.msg ?? "failed", messageType: MessageType.erorr);
                      }
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Divider(
                          height: 1,
                          color: AppColors.borderColor,
                        ),
                      ),
                      SizedBox(
                        width: 25.w,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        "Or Login With Account",
                        style: TextStyle(
                            color: AppColors.descText,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 25.w,
                      ),
                      Expanded(
                        child: Divider(
                          height: 1,
                          color: AppColors.borderColor,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: FilledButton.icon(
                          onPressed: () {},
                          icon: AppImage(
                            "assets/images/google.png",
                            width: 16.w,
                            hieght: 16.h,
                          ),
                          label: Text(
                            "Google",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          style: FilledButton.styleFrom(
                              backgroundColor: Colors.white,
                              fixedSize: Size.fromHeight(46),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              side: BorderSide(
                                color: AppColors.borderColor,
                              )),
                        ),
                      ),
                      SizedBox(
                        width: 19.w,
                      ),
                      Expanded(
                        child: FilledButton.icon(
                          onPressed: () {},
                          icon: AppImage("assets/images/Facebook (1).png",
                              width: 16.w, hieght: 16.h),
                          label: Text(
                            "Facebook",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          style: FilledButton.styleFrom(
                              backgroundColor: Colors.white,
                              fixedSize: Size.fromHeight(46),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 154),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              side: BorderSide(
                                color: AppColors.borderColor,
                              )),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
