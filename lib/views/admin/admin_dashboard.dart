import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:law_application/views/admin/All%20client/allClient.dart';
import 'package:law_application/views/admin/All%20lawyers/allLawyer.dart';
import 'package:law_application/views/admin/complain.dart';
import 'package:law_application/views/admin/profile%20module/admin_profile_screen.dart';
import 'package:law_application/views/services/session_manager.dart';

import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../res/colors.dart';

class admin_dashboard_View extends StatefulWidget {
  const admin_dashboard_View({super.key});

  @override
  State<admin_dashboard_View> createState() => _admin_dashboard_ViewState();
}

DatabaseReference adminref = FirebaseDatabase.instance.ref().child('admin');

class _admin_dashboard_ViewState extends State<admin_dashboard_View> {
  Widget build(BuildContext Context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40),
        child: StreamBuilder(
            stream:
                adminref.child(SessionController().userid.toString()).onValue,
            builder: (context, AsyncSnapshot snapshot) {
              Map<dynamic, dynamic> map = snapshot.data.snapshot.value;
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Hello ' + map['username'] + '!',
                          style: TextStyle(fontSize: 20, color: Colors.grey)),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Center(
                          child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: AppColors.primarybuttonColor,
                                      width: 2)),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: map['Profilepicture'].toString() == ''
                                      ? const Icon(Icons.person)
                                      : Image(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              map['Profilepicture'].toString()),
                                          loadingBuilder: (context, child,
                                              loadingProgress) {
                                            if (loadingProgress == null)
                                              return child;
                                            return Center(
                                                child:
                                                    CircularProgressIndicator());
                                          },
                                        ))),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Wear Your\nAdmin Caps 🛠️👨🏻‍💻',
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
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
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.lightGreen.withOpacity(0.2),
                                  blurRadius: 2,
                                  spreadRadius: 1,
                                  offset: Offset(0, 4))
                            ],
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.lightGreen,
                          ),
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
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.blue.withOpacity(0.2),
                                  blurRadius: 2,
                                  spreadRadius: 1,
                                  offset: Offset(0, 4))
                            ],
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.blue,
                          ),
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
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.purple.withOpacity(0.2),
                                    blurRadius: 2,
                                    spreadRadius: 1,
                                    offset: Offset(0, 4))
                              ],
                              color: Colors.purple,
                              borderRadius: BorderRadius.circular(15)),
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
                          height: 140,
                          width: 150,
                          decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                    color: AppColors.alertColor,
                                    blurRadius: 2,
                                    spreadRadius: 1,
                                    offset: Offset(0, 4))
                              ],
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.alertColor),
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
              );
            }),
      ),
    );
  }
}
