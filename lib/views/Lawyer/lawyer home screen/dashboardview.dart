import 'package:flutter/material.dart';
import 'package:law_application/Chat/lawyer_chat_list.dart';

import 'package:law_application/views/Lawyer/lawyer%20dashboard/lawyer%20profile%20section/lawyer_profile.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../res/colors.dart';
import '../lawyer dashboard/lawyer home screen/lawyerHomeScreen.dart';

class lawyerdashboardView extends StatefulWidget {
  const lawyerdashboardView({super.key});

  @override
  State<lawyerdashboardView> createState() => _lawyerdashboardViewState();
}

class _lawyerdashboardViewState extends State<lawyerdashboardView> {
  final PersistentController = PersistentTabController(initialIndex: 0);
  List<Widget> _buildscreens() {
    return [lawyerhomescreen(), lawyer_chat_list(), lawyerprofile()];
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
      navBarHeight: 40,
      controller: PersistentController,
      backgroundColor: AppColors.otpBackgroundColor,
      decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(0),
          colorBehindNavBar: Colors.red),
      navBarStyle: NavBarStyle.style11,
      popAllScreensOnTapAnyTabs: false,
    );
  }
}
