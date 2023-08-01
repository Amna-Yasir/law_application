import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:law_application/res/components/lawyer%20view%20list/lawyercategorylist.dart';
import 'package:law_application/res/components/lawyer%20view%20list/popularlawyerlist.dart';
import 'package:law_application/res/components/lawyer%20view%20list/profilelist.dart';
import 'package:law_application/views/Lawyer/lawyer%20dashboard/case%20managment%20module/case_managment.dart';
import 'package:law_application/views/Lawyer/lawyer%20dashboard/lawyer%20appointment%20secreens/lawyer_appointment_screen.dart';
import 'package:law_application/views/Lawyer/lawyer%20dashboard/lawyer%20home%20screen/license.dart';
import 'package:law_application/views/client/complaint/complaint.dart';
import 'package:law_application/views/services/session_manager.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../../utils/routes/routesname.dart';

class lawyerhomescreen extends StatefulWidget {
  const lawyerhomescreen({super.key});

  @override
  State<lawyerhomescreen> createState() => _lawyerhomescreenState();
}

class _lawyerhomescreenState extends State<lawyerhomescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: const Text(
          'Law Firm',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.normal),
        ),
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth auth = FirebaseAuth.instance;
                auth.signOut().then((value) {
                  SessionController().userid = '';
                  Navigator.pushNamed(context, RouteName.usermanagerView);
                });
              },
              icon: Icon(Icons.logout_outlined))
        ],
      ),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(),
          child: Column(
            children: <Widget>[
              DrawerHeader(
                  child:
                      Image(image: AssetImage('assets/images/Fav icon.png'))),
              Expanded(
                child: Column(children: <Widget>[
                  Divider(
                    thickness: 3,
                  ),
                  ListTile(
                    title: Text(
                      'License and CNIC',
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
                          screen: LicenseandCnic(), withNavBar: false);
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
                          screen: lawyer_appointment_screen(),
                          withNavBar: false);
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
                          screen: L_casemanagement(), withNavBar: false);
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
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Select Category',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 160,
                child: const lawyerCategoryList(),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Lawyers Near me',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 170,
                child: const Lawyerprofilelist(),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'All Lawyer',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 180,
                child: const Fullpopularlawyerlist(),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
