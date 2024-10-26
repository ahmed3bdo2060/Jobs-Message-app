import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class SpalshView extends StatefulWidget {
  const SpalshView({super.key});

  @override
  State<SpalshView> createState() => _SpalshViewState();
}

class _SpalshViewState extends State<SpalshView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: Container(
            height: double.infinity,
            width: double.infinity,
            color: Color(0xffD6E4FF).withOpacity(.14),
            child: Center(
              child: Stack(
                children: [ FadeInRight(
                  duration: Duration(seconds: 1),
                  child: Container(
                  height: 190,
                  width: 190,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Color(0xffD6E4FF).withOpacity(.30),),),
                ),
              Padding(
                padding: EdgeInsets.only(top: 83,left: 25),
                child: Stack(
                  children: [
                    FadeInDown(duration: Duration(seconds: 1),child: Text("J    BSQUE",
                    style: TextStyle(
                      fontFamily: "ABeeZeeRegular",
                      fontSize: 28,
                      fontWeight: FontWeight.bold
                    ),)),
                    FadeInUp(duration: Duration(seconds: 1),child: Padding(
                        padding: EdgeInsets.only(left: 18, top: 7),
                        child: Image.asset(
                          "assets/images/search-status.png", height: 24,
                          width: 24,)))
                  ],
                ),
              ),
            ])
        )));

  }
}
