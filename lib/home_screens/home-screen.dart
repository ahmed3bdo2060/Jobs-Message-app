import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:jobs/core/componnet/app_image.dart';
import 'package:jobs/core/componnet/colors.dart';
import 'package:jobs/home_screens/pages/messages/messages.dart';
import 'package:jobs/home_screens/pages/saved/save_job.dart';

import '../../home_screens/pages/applied.dart';
import 'pages/home_page/home.dart';
import 'pages/profile/profile.dart';
final pageController= PageController();
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  final icons = [
    "assets/svg/home.svg",
    "assets/svg/message.svg",
    "assets/svg/briefcase.svg",
    "assets/svg/archive-minus.svg",
    "assets/svg/profile (1).svg"
  ];
  final titles = ["Home", "Messages", "Applied", "Saved", "Profile"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(currentIndex:currentIndex,
          onTap: (value) {
            currentIndex=value;
            _pageController.jumpToPage(currentIndex);
            setState(() {

            });
          },
          showSelectedLabels: true,
          selectedItemColor: AppColors.buttonColor,
          selectedFontSize: 10,
          unselectedFontSize: 10,

          unselectedItemColor: AppColors.iconColor,
          type: BottomNavigationBarType.fixed ,
          items: [
            BottomNavigationBarItem(icon: AppImage("assets/svg/home.svg",
                color: AppColors.iconColor),
                activeIcon: AppImage("assets/svg/home.svg",
                    color: AppColors.buttonColor),
                label:"Home" ),
            BottomNavigationBarItem(icon: AppImage("assets/svg/message.svg",
                color: AppColors.iconColor),
              activeIcon: AppImage("assets/svg/message.svg",
                  color: AppColors.buttonColor),
              label: "Messages",),
            BottomNavigationBarItem(icon: AppImage("assets/svg/briefcase.svg",
                color: AppColors.iconColor),
              activeIcon: AppImage("assets/svg/briefcase.svg",
                  color: AppColors.buttonColor),
              label: "Applied",),
            BottomNavigationBarItem(icon: AppImage("assets/svg/archive-minus.svg",
                color: AppColors.iconColor),
              activeIcon: AppImage("assets/svg/archive-minus.svg",
                  color: AppColors.buttonColor),
              label: "Saved",),
            BottomNavigationBarItem(icon: AppImage("assets/svg/profile (1).svg",
                color: AppColors.iconColor),
              activeIcon: AppImage("assets/svg/profile (1).svg",
                  color: AppColors.buttonColor),
              label: "Profile",)
          ]),
      body: PageView(
        controller: _pageController,
        onPageChanged: (value) {
          currentIndex = value;
          setState(() {});
        },
        children:[
          HomeScreenPage(),
          MessagesPage(),
          AppliedPage(),
          SaveJob(),
          ProfileView(),
        ],
      )
    );
  }
}
