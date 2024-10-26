import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs/auth/login/login_view.dart';
import 'package:jobs/core/componnet/app_image.dart';
import 'package:jobs/core/componnet/colors.dart';
import 'package:jobs/core/logic/cash_helper.dart';
import 'package:jobs/core/logic/helper_methods.dart';
import 'package:jobs/home_screens/pages/profile/profile_pages/edit-portfolio.dart';
import 'package:jobs/home_screens/pages/profile/profile_pages/edit_language.dart';
import 'package:jobs/home_screens/pages/profile/profile_pages/editprofile.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Profile"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            navigateTo(LoginView());
          }, icon: AppImage("assets/images/logout (2).png"))
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [Container(
                height: 195.h,
                color: Color(0xffD6E4FF),
              ),
                Positioned(
                  top: 195.h,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(height: 52,),
                        Text(CashHelper.userName,style: TextStyle(
                          fontWeight: FontWeight.bold,fontSize: 20
                        ),),
                        Text("Senior UI/UX Designer",
                        style: TextStyle(fontSize: 14,
                        fontWeight: FontWeight.w400,color: AppColors.iconColor),),
                        SizedBox(height: 32,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                          Column(children: [
                            Text("Applied",style: TextStyle(fontSize: 14,
                                fontWeight: FontWeight.w400,color: AppColors.iconColor)),
                            SizedBox(height: 8.h,),
                            Text("46")
                          ],),Column(children: [
                            Text("Reviewed",style: TextStyle(fontSize: 14,
                                fontWeight: FontWeight.w400,color: AppColors.iconColor)),
                            SizedBox(height: 8.h,),
                            Text("26")
                          ],),Column(children: [
                            Text("Contacted",style: TextStyle(fontSize: 14,
                                fontWeight: FontWeight.w400,color: AppColors.iconColor)),
                            SizedBox(height: 8.h,),
                            Text("23")
                          ],),
                        ],),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w), child: Column(
                            children: [
                              Row(
                                children: [
                                  Text("About",style: TextStyle(fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.iconColor)),
                                  Spacer(),
                                  TextButton(onPressed: (){}, child: Text("Edit",
                                  style: TextStyle(color: AppColors.buttonColor),))
                                ],
                              ),
                              Text("I'm ${CashHelper.userName}, I’m UI/UX Designer, I have experience designing UI Design for approximately 1 year. I am currently joining the Vektora studio team based in Surakarta, Indonesia.I am a person who has a high spirit and likes to work to achieve what I dream of.",
                              style: TextStyle(color: AppColors.iconColor,fontSize: 12),)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 545,
                    right: 0,
                    left: 0,
                    bottom: 0,
                    child: Container(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                           Container(
                             decoration: BoxDecoration(
                               color: Color(0xffE5E7EB).withOpacity(.6),
                                border: Border(top: BorderSide(color: AppColors.borderColor,),
                                bottom: BorderSide(color: AppColors.borderColor))
                             ),
                             child: Padding(padding: EdgeInsets.symmetric(horizontal: 24,
                                 vertical: 8),
                                 child: Text('General',
                                     style: TextStyle(color: AppColors.iconColor,
                                         fontSize: 12),
                                 ),
                             ),
                           ),
                            SizedBox(height: 16,),
                            InkWell(
                              onTap: () {
                                navigateTo(EditProfilePage(),keepHistory: true);
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 24),
                                child: Row(children: [
                                  AppImage("assets/images/editprofile.png",
                                    hieght: 40,
                                    width: 40,),
                                  SizedBox(width: 12,),
                                  Text("Edit Profile"),
                                  Spacer(),
                                  Icon(Icons.arrow_forward_outlined,size: 16,)
                                ],),
                              ),
                            ),
                            SizedBox(height: 18,),
                            InkWell(
                              onTap: () {
                                navigateTo(EditPortfolioPage());
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 24),
                                child: Row(children: [
                                  AppImage("assets/images/editportfolio.png",
                                    hieght: 40,
                                    width: 40,),
                                  SizedBox(width: 12,),
                                  Text("Portfolio"),
                                  Spacer(),
                                  Icon(Icons.arrow_forward_outlined,size: 16,)
                                ],),
                              ),
                            ),
                            SizedBox(height: 18,),
                            InkWell(
                              onTap: () {
                                navigateTo(EditLanguage());
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 24),
                                child: Row(children: [
                                  AppImage("assets/images/editlanguage.png",
                                    hieght: 40,
                                    width: 40,),
                                  SizedBox(width: 12,),
                                  Text("Langauge"),
                                  Spacer(),
                                  Icon(Icons.arrow_forward_outlined,size: 16,)
                                ],),
                              ),
                            ),
                            SizedBox(height: 18,),
                            InkWell(
                              onTap: () {

                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 24),
                                child: Row(children: [
                                  AppImage("assets/images/editnotification.png",
                                    hieght: 40,
                                    width: 40,),
                                  SizedBox(width: 12,),
                                  Text("Notification"),
                                  Spacer(),
                                  Icon(Icons.arrow_forward_outlined,size: 16,)
                                ],),
                              ),
                            ),
                            SizedBox(height: 18,),
                            InkWell(
                              onTap: () {

                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 24),
                                child: Row(children: [
                                  AppImage("assets/images/editlogin.png",
                                    hieght: 40,
                                    width: 40,),
                                  SizedBox(width: 12,),
                                  Text("Login and security"),
                                  Spacer(),
                                  Icon(Icons.arrow_forward_outlined,size: 16,)
                                ],),
                              ),
                            ),
                            SizedBox(height: 32,),
                            Container(
                              decoration: BoxDecoration(
                                  color: Color(0xffE5E7EB).withOpacity(.6),
                                  border: Border(top: BorderSide(color: AppColors.borderColor,),
                                      bottom: BorderSide(color: AppColors.borderColor))
                              ),
                              child: Padding(padding: EdgeInsets.symmetric(horizontal: 24,
                                  vertical: 8),
                                child: Text('Others',
                                  style: TextStyle(color: AppColors.iconColor,
                                      fontSize: 12),
                                ),
                              ),
                            ),
                            SizedBox(height: 16,),
                            InkWell(
                              onTap: () {

                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 24),
                                child: Row(children: [
                                  Text("Accesibility"),
                                  Spacer(),
                                  Icon(Icons.arrow_forward_outlined,size: 16,)
                                ],),
                              ),
                            ),
                            SizedBox(height: 18,),
                            InkWell(
                              onTap: () {

                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 24),
                                child: Row(children: [
                                  Text("Help Center"),
                                  Spacer(),
                                  Icon(Icons.arrow_forward_outlined,size: 16,)
                                ],),
                              ),
                            ),
                            SizedBox(height: 18,),
                            InkWell(
                              onTap: () {

                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 24),
                                child: Row(children: [
                                  Text("Terms & Conditions"),
                                  Spacer(),
                                  Icon(Icons.arrow_forward_outlined,size: 16,)
                                ],),
                              ),
                            ),
                            SizedBox(height: 18,),
                            InkWell(
                              onTap: () {

                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 24),
                                child: Row(children: [
                                  Text("Privacy Policy"),
                                  Spacer(),
                                  Icon(Icons.arrow_forward_outlined,size: 16,)
                                ],),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                Positioned(
                  top: 141.h,
                  left: 145.w,
                  child: Container(width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(width: 4,color: Colors.white)
                    ),
                    child: AppImage("assets/images/argantina.png",
                      fit: BoxFit.cover,),
                  ),
                ),
              ],
            ),
          )

        ],
      ),
    );
  }
}
