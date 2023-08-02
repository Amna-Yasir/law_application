import 'package:flutter/material.dart';
import 'package:law_application/Chat/user_chat_list.dart';

import 'package:law_application/views/client/Profile%20Module/profile_screen.dart';
import 'package:law_application/views/client/homescreen/homepage.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../res/colors.dart';

class dashboardView extends StatefulWidget {
  const dashboardView({super.key});

  @override
  State<dashboardView> createState() => _dashboardViewState();
}

class _dashboardViewState extends State<dashboardView> {
  final persistentcontroller = PersistentTabController(initialIndex: 0);
  List<Widget> _buildscreens() {
    return [
      homescreen(),
      chatlist(),
      profilescreen(),
    ];
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
        activeColorPrimary: Colors.blue,
        inactiveIcon: Icon(
          Icons.message,
          color: Colors.grey,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.person,
        ),
        activeColorPrimary: Colors.green,
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
      controller: persistentcontroller,
      backgroundColor: AppColors.otpBackgroundColor,
      padding: NavBarPadding.all(5),
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(0),
      ),
      navBarStyle: NavBarStyle.style12,
      popAllScreensOnTapAnyTabs: false,
    );
  }
}
