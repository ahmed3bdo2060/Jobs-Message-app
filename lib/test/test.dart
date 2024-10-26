import 'package:flutter/material.dart';
import 'package:jobs/core/componnet/app_button.dart';
import 'package:jobs/core/componnet/app_image.dart';
import 'package:jobs/core/componnet/app_input.dart';
import 'package:jobs/core/logic/helper_methods.dart';

import 'test1.dart';
import 'test2.dart';

class TestView extends StatefulWidget {
  static const String screenRoute = "welcome_screen";
  const TestView({super.key});

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Center(child: AppImage("assets/images/nomessage.png",
              width: 180,
              hieght: 180,),),
                SizedBox(height: 16,),
                AppButton(text: "SignIn", onPressd: () {
                  Navigator.pushNamed(context, TestView1.signIn);
                },),
                AppButton(text: "Regester", onPressd: () {
                  Navigator.pushNamed(context, TestView2.register);
                },),

          ]),
        ),
      ),
    );
  }
}
