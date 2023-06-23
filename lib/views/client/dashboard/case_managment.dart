// ignore_for_file: unused_import, camel_case_types

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
import 'package:law_application/views/client/dashboard/chatscreen.dart';
import 'package:law_application/views/services/session_manager.dart';

class casemanagement extends StatefulWidget {
  const casemanagement({super.key});

  @override
  State<casemanagement> createState() => _casemanagementState();
}

class _casemanagementState extends State<casemanagement> {
  // final auth = FirebaseAuth.instance;
  // final ref = FirebaseDatabase.instance
  //     .ref('User')
  //     .child(SessionController().userid.toString())
  //     .child('post');
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: Text('Manage Cases'),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Icon(Icons.filter_list),
              ),
            ],
            bottom: TabBar(
                indicatorColor: AppColors.primaryColor,
                labelStyle: Theme.of(context).textTheme.bodyMedium,
                tabs: [
                  Text('Active'),
                  Text('Appointments'),
                ]),
          ),
          body: SafeArea(
            child: TabBarView(children: [
              ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Your Case Progress',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                  FlipCard(
                    front: caseCard(
                      color1: AppColors.primaryColor,
                      color2: Colors.purpleAccent,
                    ),
                    fill: Fill.fillBack,
                    direction: FlipDirection.VERTICAL,
                    side: CardSide.FRONT,
                    back: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: DetailButton(
                        color1: AppColors.primaryColor,
                        color2: Colors.purpleAccent,
                      ),
                    ),
                  ),
                  FlipCard(
                    fill: Fill.fillBack,
                    direction: FlipDirection.VERTICAL,
                    side: CardSide.FRONT,
                    back: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: DetailButton(
                        color1: AppColors.primaryColor,
                        color2: Colors.pink.shade500,
                      ),
                    ),
                    front: caseCard(
                      color1: AppColors.primaryColor,
                      color2: Colors.pink.shade500,
                    ),
                  ),
                  FlipCard(
                    fill: Fill.fillBack,
                    direction: FlipDirection.VERTICAL,
                    side: CardSide.FRONT,
                    back: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: DetailButton(
                        color1: AppColors.primaryColor,
                        color2: Colors.blueGrey,
                      ),
                    ),
                    front: caseCard(
                      color1: AppColors.primaryColor,
                      color2: Colors.blueGrey,
                    ),
                  ),
                ],
              ),
              ListView(
                children: [
                  Container(
                      child: AppointmentCard(
                    color1: AppColors.primaryColor,
                    color2: AppColors.primaryColor,
                  ))
                ],
              ),
            ]),
          )),
    );
  }
}

// ignore: must_be_immutable
class DetailButton extends StatelessWidget {
  DetailButton({
    required this.color1,
    required this.color2,
    super.key,
  });
  Color color1;
  Color color2;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [color1, color2]),
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

class AppointmentCard extends StatelessWidget {
  AppointmentCard({super.key, required this.color1, required this.color2});
  final Color color1;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [color1, color2]),
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Consultation with \nAli Ahmed',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold, color: AppColors.whiteColor),
              ),
              appointmentlist(
                leadingicon: Icon(
                  Icons.date_range,
                  color: AppColors.whiteColor,
                ),
                title: 'Start date',
                trailingtext: '21-3-2021',
              ),
              appointmentlist(
                  leadingicon: Icon(Icons.alarm, color: AppColors.whiteColor),
                  trailingtext: '3 : 00 AM',
                  title: 'Time')
            ],
          ),
        ),
      ),
    );
  }
}

class appointmentlist extends StatelessWidget {
  appointmentlist(
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

class caseCard extends StatelessWidget {
  caseCard({super.key, required this.color1, required this.color2});
  final Color color1;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [color1, color2]),
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
                'Case Number : 129',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.white70),
              ),
              Text(
                'Co-operative Insurance v Argyll Stores',
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
                trailingtext: 'High Court',
              ),
              caselist(
                leadingicon: Icon(Icons.date_range),
                title: 'Start date',
                trailingtext: '21-3-2021',
              ),
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
