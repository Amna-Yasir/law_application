// ignore_for_file: unused_local_variable

import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:law_application/views/Lawyer/lawyer%20dashboard/lawyer_detail.dart';

import '../card/profilecard.dart';

class profilelist extends StatelessWidget {
  const profilelist({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    DatabaseReference ref = FirebaseDatabase.instance.ref().child('lawyer');
    return FirebaseAnimatedList(
        defaultChild: Center(child: CircularProgressIndicator()),
        scrollDirection: Axis.horizontal,
        query: ref,
        itemBuilder: (context, snapshot, animation, index) {
          double generateRandomNumberString() {
            Random random = Random();
            double randomNumber = random.nextDouble() * (5.0 - 3.0) +
                3.0; // Generate a random number between 3.0 and 5.0
            return double.parse(randomNumber.toStringAsFixed(1));
          }

          if (snapshot.exists) {
            return Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: profilecard(
                LawyerName: snapshot.child('username').value.toString(),
                lawyercategory: snapshot
                    .child('extrainfo')
                    .child('category')
                    .value
                    .toString(),
                imageurl:
                    'https://images.unsplash.com/photo-1599834562135-b6fc90e642ca?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                finalRating: generateRandomNumberString(),
                ontap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => lawyerdetail(
                          Username: snapshot.child('username').value.toString(),
                          address: snapshot
                              .child('extrainfo')
                              .child('address')
                              .value
                              .toString(),
                          rating: generateRandomNumberString(),
                          about: snapshot
                              .child('extrainfo')
                              .child('aboutyourself')
                              .value
                              .toString(),
                          feeperhour: snapshot
                              .child('extrainfo')
                              .child('feeperhour')
                              .value
                              .toString(),
                          phone: snapshot
                              .child('extrainfo')
                              .child('Phone')
                              .value
                              .toString(),
                          currentlyWorking: snapshot
                              .child('extrainfo')
                              .child('practicing')
                              .value
                              .toString(),
                        ),
                      ));
                },
              ),
            );
          } else {
            return Text('No Lawyer Registered');
          }

          // profilecard(
          //   LawyerName: 'Alis Akter',
          //   lawyercategory: 'Divorce',
          //   imageurl:
          //       'https://images.unsplash.com/photo-1581841064838-a470c740e8ee?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
          //   rating: '800+',
          // ),
          // SizedBox(
          //   width: 10,
          // ),
          // profilecard(
          //   LawyerName: 'Zara Ali',
          //   lawyercategory: 'Goverment',
          //   imageurl:
          //       'https://images.unsplash.com/photo-1603988089669-c041ac2fe196?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
          //   rating: '99+',
          // ),
          // SizedBox(
          //   width: 10,
          // ),
          // profilecard(
          //   LawyerName: 'Kim Jenner',
          //   lawyercategory: 'Sale',
          //   imageurl:
          //       'https://images.unsplash.com/photo-1582141011660-4f8a49ded25b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80',
          //   rating: '800+',
          // );
        });
  }
}
