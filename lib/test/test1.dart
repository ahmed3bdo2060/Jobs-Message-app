import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jobs/core/componnet/app_button.dart';
import 'package:jobs/core/componnet/app_image.dart';
import 'package:jobs/core/componnet/app_input.dart';
import 'package:jobs/test/test_message.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class TestView1 extends StatefulWidget {
  static const String signIn = "sign_in";
  const TestView1({super.key});

  @override
  State<TestView1> createState() => _TestViewState();
}

class _TestViewState extends State<TestView1> {
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
                  AppButton(text: "SignIn", onPressd: ()async {
                    _saving = true;
                    setState(() {

                    });
                    try{
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if(user!=null){
                        Navigator.pushNamed(context, TestViewMessage.message);
                        _saving= false;
                        setState(() {

                        });
                      }
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
