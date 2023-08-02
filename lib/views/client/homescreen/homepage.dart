import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:law_application/views/client/Case%20Managment%20Module/case_managment.dart';
import 'package:law_application/views/client/Appointment%20Module/clientappointment_screen.dart.dart';
import 'package:law_application/views/client/complaint/complaint.dart';
import 'package:law_application/views/client/homescreen/uploadcnic.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../res/components/client list/categoryList.dart';
import '../../../res/components/client list/All_lawyer_list.dart';
import '../../../res/components/client list/lawyer_near_me_list.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('User');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Law Firm',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.normal),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
                child: Image(image: AssetImage('assets/images/Fav icon.png'))),
            Expanded(
              child: Column(children: <Widget>[
                Divider(
                  thickness: 3,
                ),
                ListTile(
                  title: Text(
                    'Upload Documents',
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                  leading: Icon(
                    Icons.edit_document,
                    size: 20.0,
                    color: Colors.black,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    PersistentNavBarNavigator.pushNewScreen(context,
                        screen: Client_Cnic(), withNavBar: false);
                  },
                ),
                ListTile(
                  title: Text(
                    'Appointments',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  leading: Icon(
                    Icons.calendar_month,
                    size: 20.0,
                    color: Colors.black,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    PersistentNavBarNavigator.pushNewScreen(context,
                        screen: clientappointmentscreen(), withNavBar: false);
                  },
                ),
                ListTile(
                  title: Text(
                    'Cases',
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                  leading: Icon(
                    Icons.library_books,
                    size: 20.0,
                    color: Colors.black,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    PersistentNavBarNavigator.pushNewScreen(context,
                        screen: casemanagement(), withNavBar: false);
                  },
                ),
              ]),
            ),
            Container(
                child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Column(
                      children: <Widget>[
                        Divider(),
                        ListTile(
                            onTap: () {
                              Navigator.pop(context);
                              PersistentNavBarNavigator.pushNewScreen(context,
                                  screen: helpcenter(), withNavBar: false);
                            },
                            leading: Icon(Icons.help),
                            title: Text('Help Center')),
                      ],
                    ))),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Select Category',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 160,
                child: CategoryList(),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Lawyers Near me',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 170,
                child: profilelist(),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'All Lawyer',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 180,
                child: popularlawyerlist(),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

class listTile extends StatelessWidget {
  listTile({required this.listtile, required this.onTap});
  final String listtile;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(listtile),
      onTap: onTap,
    );
  }
}
