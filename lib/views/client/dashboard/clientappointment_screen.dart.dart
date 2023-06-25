import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import '../../../res/colors.dart';
import '../../services/session_manager.dart';

class clientappointmentscreen extends StatefulWidget {
  const clientappointmentscreen({super.key});

  @override
  State<clientappointmentscreen> createState() =>
      _clientappointmentscreenState();
}

class _clientappointmentscreenState extends State<clientappointmentscreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  DatabaseReference ref = FirebaseDatabase.instance
      .ref()
      .child('User')
      .child(SessionController().userid.toString())
      .child('Appointment');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointment'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Appointments',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Expanded(
              child: FirebaseAnimatedList(
                defaultChild: Text('No appointment'),
                query: ref,
                itemBuilder: (context, snapshot, animation, index) {
                  return AppointmentCard(
                    color1: AppColors.primaryColor,
                    color2: AppColors.primaryColor,
                    date: snapshot.child('date').value.toString(),
                    time: snapshot.child('time').value.toString(),
                    location: snapshot.child('location').value.toString(),
                    Phone: snapshot.child('phone').value.toString(),
                    username: snapshot.child('lawyername').value.toString(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  AppointmentCard(
      {super.key,
      required this.color1,
      required this.color2,
      required this.date,
      required this.time,
      required this.location,
      required this.Phone,
      required this.username});
  final Color color1;
  final Color color2;
  final String date;
  final String time;
  final String location;
  final String Phone;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [AppColors.primaryColor, Colors.pink]),
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Consultation with \n' + username,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold, color: AppColors.whiteColor),
              ),
              appointmentlist(
                leadingicon: Icon(
                  Icons.date_range,
                  color: AppColors.whiteColor,
                ),
                title: 'Date',
                trailingtext: date,
              ),
              appointmentlist(
                  leadingicon: Icon(Icons.alarm, color: AppColors.whiteColor),
                  trailingtext: time,
                  title: 'Time'),
              appointmentlist(
                leadingicon: Icon(
                  Icons.location_pin,
                  color: AppColors.whiteColor,
                ),
                title: 'Location',
                trailingtext: location,
              ),
              appointmentlist(
                leadingicon: Icon(
                  Icons.phone,
                  color: AppColors.whiteColor,
                ),
                title: 'Phone',
                trailingtext: Phone,
              ),
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
