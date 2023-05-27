import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:law_application/views/Lawyer/lawyer%20dashboard/lawyer_profile.dart';
import 'package:law_application/views/client/dashboard/chatscreen.dart';
import 'package:law_application/views/client/homescreen/homepage.dart';
import 'package:law_application/views/client/dashboard/case_managment.dart';
import 'package:law_application/views/client/dashboard/profilescreen/profile_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../res/colors.dart';

class lawyerdashboardView extends StatefulWidget {
  const lawyerdashboardView({super.key});

  @override
  State<lawyerdashboardView> createState() => _lawyerdashboardViewState();
}

class _lawyerdashboardViewState extends State<lawyerdashboardView> {
  @override
  final persistentcontroller = PersistentTabController(initialIndex: 0);
  List<Widget> _buildscreens() {
    return [homescreen(), chatscreen(), casemanagement(), lawyerprofile()];
  }

  List<PersistentBottomNavBarItem> _navbarItem() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.home,
        ),
        activeColorPrimary: AppColors.primaryColor,
        inactiveIcon: Icon(
          Icons.home,
          color: Colors.grey,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.message,
        ),
        activeColorPrimary: AppColors.primaryColor,
        inactiveIcon: Icon(
          Icons.message,
          color: Colors.grey,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.line_style,
        ),
        activeColorPrimary: AppColors.primaryColor,
        inactiveIcon: Icon(
          Icons.line_style,
          color: Colors.grey,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.person,
        ),
        activeColorPrimary: AppColors.primaryColor,
        inactiveIcon: Icon(
          Icons.person,
          color: Colors.grey,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildscreens(),
      items: _navbarItem(),
      navBarHeight: 20,
      controller: persistentcontroller,
      backgroundColor: AppColors.otpBackgroundColor,
      decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(0),
          colorBehindNavBar: Colors.red),
      navBarStyle: NavBarStyle.style1,
      popAllScreensOnTapAnyTabs: false,
    );
  }
}
