import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:law_application/views/Lawyer/case%20managment%20module/case_managment.dart';
import 'package:law_application/views/Lawyer/lawyer%20appointment%20secreens/lawyer_appointment_screen.dart';
import 'package:law_application/views/services/session_manager.dart';

import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../res/colors.dart';

import '../lawyer dashboard/lawyer home screen/license.dart';
import '../lawyer dashboard/lawyer profile section/lawyer_profile.dart';

class lawyerhomescreen extends StatefulWidget {
  const lawyerhomescreen({super.key});

  @override
  State<lawyerhomescreen> createState() => _lawyerhomescreenState();
}

DatabaseReference lawyerref = FirebaseDatabase.instance.ref().child('lawyer');

class _lawyerhomescreenState extends State<lawyerhomescreen> {
  @override
  Widget build(BuildContext Context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40),
          child: StreamBuilder(
              stream: lawyerref
                  .child(SessionController().userid.toString())
                  .onValue,
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
                                    child: map['profile'].toString() == ''
                                        ? const Icon(Icons.person)
                                        : Image(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                map['profile'].toString()),
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
                      'Start Your\nLegal Services',
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
                                screen: lawyer_appointment_screen());
                          },
                          child: Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.blueAccent.withOpacity(0.2),
                                    blurRadius: 2,
                                    spreadRadius: 1,
                                    offset: Offset(0, 4))
                              ],
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.blueAccent,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.calendar_month,
                                    color: Colors.white,
                                    size: 95,
                                  ),
                                  Text(
                                    'Appointments',
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
                                screen: L_casemanagement());
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
                                    Icons.library_books_outlined,
                                    color: Colors.white,
                                    size: 95,
                                  ),
                                  Text(
                                    'Cases',
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
                                screen: lawyerprofile());
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
                                screen: LicenseandCnic());
                          },
                          child: Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.deepOrange.withOpacity(0.2),
                                      blurRadius: 2,
                                      spreadRadius: 1,
                                      offset: Offset(0, 4))
                                ],
                                color: Colors.deepOrange,
                                borderRadius: BorderRadius.circular(15)),
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
                                    'My documents',
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
      ),
    );
  }
}
