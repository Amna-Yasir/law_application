import 'package:flutter/material.dart';
import 'package:law_application/views/admin/All%20client/allClient.dart';
import 'package:law_application/views/admin/All%20lawyers/allLawyer.dart';
import 'package:law_application/views/admin/complain.dart';
import 'package:law_application/views/admin/profile%20module/admin_profile_screen.dart';

import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../res/colors.dart';

class admin_dashboard_View extends StatefulWidget {
  const admin_dashboard_View({super.key});

  @override
  State<admin_dashboard_View> createState() => _admin_dashboard_ViewState();
}

class _admin_dashboard_ViewState extends State<admin_dashboard_View> {
  Widget build(BuildContext Context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        leading: Icon(Icons.list),
        actions: const [Icon(Icons.person_3_rounded)],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Admin 1',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    PersistentNavBarNavigator.pushNewScreen(context,
                        screen: All_lawyer());
                  },
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 2,
                              spreadRadius: 1,
                              offset: Offset(0, 4))
                        ],
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.primaryIconColor),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Column(
                        children: [
                          Icon(
                            Icons.account_balance,
                            color: Colors.white,
                            size: 95,
                          ),
                          Text(
                            'Lawyers',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: AppColors.whiteColor),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    PersistentNavBarNavigator.pushNewScreen(context,
                        screen: clientlist());
                  },
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 2,
                              spreadRadius: 1,
                              offset: Offset(0, 4))
                        ],
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.primaryIconColor),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Column(
                        children: [
                          Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 95,
                          ),
                          Text(
                            'Clients',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: AppColors.whiteColor),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    PersistentNavBarNavigator.pushNewScreen(context,
                        screen: admin_profilescreen());
                  },
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 2,
                              spreadRadius: 1,
                              offset: Offset(0, 4))
                        ],
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.primaryIconColor),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Column(
                        children: [
                          Icon(
                            Icons.person_pin_sharp,
                            color: Colors.white,
                            size: 95,
                          ),
                          Text(
                            'My Profile',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: AppColors.whiteColor),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    PersistentNavBarNavigator.pushNewScreen(context,
                        screen: complaint());
                  },
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 2,
                              spreadRadius: 1,
                              offset: Offset(0, 4))
                        ],
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.primaryIconColor),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Column(
                        children: [
                          Icon(
                            Icons.list_alt,
                            color: Colors.white,
                            size: 95,
                          ),
                          Text(
                            'Complaint',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: AppColors.whiteColor),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
