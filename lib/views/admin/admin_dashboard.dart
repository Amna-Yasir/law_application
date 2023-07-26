import 'package:flutter/material.dart';
import 'package:law_application/views/admin/profile%20module/admin_profile_screen.dart';

import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../res/colors.dart';

class admin_dashboard_View extends StatefulWidget {
  const admin_dashboard_View({super.key});

  @override
  State<admin_dashboard_View> createState() => _admin_dashboard_ViewState();
}

class _admin_dashboard_ViewState extends State<admin_dashboard_View> {
  final persistentcontroller = PersistentTabController(initialIndex: 0);
  List<Widget> _buildscreens() {
    return [
      Text('Lawyer'),
      Text('Lawyer'),
      admin_profilescreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navbarItem() {
    return [
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
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.person_4,
        ),
        activeColorPrimary: AppColors.primaryColor,
        inactiveIcon: Icon(
          Icons.person_4,
          color: Colors.grey,
        ),
      ),
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
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildscreens(),
      items: _navbarItem(),
      navBarHeight: 40,
      controller: persistentcontroller,
      backgroundColor: AppColors.otpBackgroundColor,
      padding: NavBarPadding.all(5),
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(0),
      ),
      navBarStyle: NavBarStyle.style8,
      popAllScreensOnTapAnyTabs: false,
    );
  }
}
