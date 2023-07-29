// ignore_for_file: unused_import, camel_case_types, must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:law_application/res/colors.dart';
import 'package:law_application/res/components/roundbutton.dart';
import 'package:law_application/views/Lawyer/lawyer%20dashboard/lawyer%20appointment%20secreens/booking_screen.dart';
import 'package:law_application/views/Lawyer/lawyer%20dashboard/case%20managment%20module/lawyer_case_detail.dart';
import 'package:law_application/views/client/homescreen/case%20managment%20module/case_detail.dart';

import 'package:law_application/views/services/session_manager.dart';

class admin_view_of_cases extends StatefulWidget {
  const admin_view_of_cases({
    super.key,
    required this.lawyerid,
  });
  final lawyerid;

  @override
  State<admin_view_of_cases> createState() => _admin_view_of_casesState();
}

class _admin_view_of_casesState extends State<admin_view_of_cases> {
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('lawyer');

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(' Case'),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Icon(Icons.filter_list),
              ),
            ],
          ),
          body: SafeArea(
            child: FirebaseAnimatedList(
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                return Column(
                  children: [
                    Text(
                      'Active Cases',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    caseCard(
                      casenumber: snapshot.child('id').value.toString(),
                      casetitle: snapshot.child('clientname').value.toString() +
                          '  ' +
                          'v' +
                          '  ' +
                          snapshot.child('oppname').value.toString(),
                      location: snapshot.child('location').value.toString(),
                      startdate: snapshot.child('date').value.toString(),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => C_CourtCasePage(
                                      casenumber:
                                          snapshot.child('id').value.toString(),
                                      Casetitle: snapshot
                                              .child('clientname')
                                              .value
                                              .toString() +
                                          '  ' +
                                          'v' +
                                          '  ' +
                                          snapshot
                                              .child('oppname')
                                              .value
                                              .toString(),
                                      Court: snapshot
                                          .child('location')
                                          .value
                                          .toString(),
                                      Startingdate: snapshot
                                          .child('date')
                                          .value
                                          .toString(),
                                      opname: snapshot
                                          .child('oppname')
                                          .value
                                          .toString(),
                                      clientname: snapshot
                                          .child('clientname')
                                          .value
                                          .toString(),
                                      hearingstatus: snapshot
                                          .child('nexthearing')
                                          .value
                                          .toString(),
                                      judgeremarks: snapshot
                                          .child('CaseDescription')
                                          .value
                                          .toString(),
                                    )));
                      },
                    ),
                  ],
                );
              },
              query: ref.child(widget.lawyerid).child('Case'),
            ),
          )),
    );
  }
}

class DetailButton extends StatelessWidget {
  DetailButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient:
            LinearGradient(colors: [AppColors.primaryColor, Colors.pinkAccent]),
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          roundButton(
            title: 'Check Details',
            onpress: () {},
          )
        ],
      ),
    );
  }
}

class caseCard extends StatelessWidget {
  caseCard({
    super.key,
    required this.casenumber,
    required this.casetitle,
    required this.location,
    required this.startdate,
    required this.onTap,
  });
  String casenumber;
  String casetitle;
  String location;
  String startdate;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [AppColors.primaryColor, Colors.pinkAccent]),
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                casenumber,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.white70),
              ),
              Text(
                casetitle,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              caselist(
                leadingicon: Icon(Icons.location_on_outlined),
                title: 'Location',
                trailingtext: location,
              ),
              caselist(
                leadingicon: Icon(Icons.date_range),
                title: 'Start date',
                trailingtext: startdate,
              ),
              Center(
                child: roundButton(title: 'Check Details', onpress: onTap),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class caselist extends StatelessWidget {
  caselist(
      {super.key,
      required this.leadingicon,
      required this.trailingtext,
      required this.title});
  final Widget leadingicon;
  final String trailingtext;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leadingicon,
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: Colors.white),
      ),
      trailing: Text(
        trailingtext,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: Colors.white),
      ),
    );
  }
}
