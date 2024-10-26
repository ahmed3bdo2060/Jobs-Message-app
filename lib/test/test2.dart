

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jobs/core/componnet/app_button.dart';
import 'package:jobs/core/componnet/app_image.dart';
import 'package:jobs/core/componnet/app_input.dart';
import 'package:jobs/core/logic/helper_methods.dart';
import 'package:jobs/test/test_message.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class TestView2 extends StatefulWidget {
  static const String register = "register";
  const TestView2({super.key});

  @override
  State<TestView2> createState() => _TestViewState();
}

class _TestViewState extends State<TestView2> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool _saving = false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: _saving,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: AppImage("assets/images/nomessage.png",
                    width: 180,
                    hieght: 180,),),
                  AppInput(
                    hint: "enter email",
                    keyboardType: TextInputType.emailAddress,
                    onChange: (p0) {
                      email = p0;
                    },
                  ),
                  SizedBox(height: 16,),
                  TextFormField(
                    obscureText: true,
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 20
                      ),
                      hintText: "enter password",
                    ),
                  ),
                  SizedBox(height: 16,),
                  AppButton(text: "Regester", onPressd: ()async {
                    _saving=true;
                    setState(() {

                    });
                    try{
                      final newUser =await _auth.createUserWithEmailAndPassword(
                          email: email, password: password);
                      Navigator.pushNamed(context, TestViewMessage.message);
                      _saving=false;
                      setState(() {

                      });
                    } catch(e){
                      print(e);
                    }
        
                  },),
        
                ]),
          ),
        ),
      ),
    );
  }
}
