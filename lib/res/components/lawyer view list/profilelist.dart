// ignore_for_file: unused_local_variable

import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:law_application/views/Lawyer/lawyer%20dashboard/lawyer%20home%20screen/lawyer_detail.dart';

import '../client card/profilecard.dart';

class Lawyerprofilelist extends StatelessWidget {
  const Lawyerprofilelist({
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
          String address =
              snapshot.child('extrainfo').child('address').value.toString();
          double generateRandomNumberString() {
            Random random = Random();
            double randomNumber = random.nextDouble() * (5.0 - 3.0) +
                3.0; // Generate a random number between 3.0 and 5.0
            return double.parse(randomNumber.toStringAsFixed(1));
          }

          if (snapshot.exists) {
            if (address == 'gujrat') {
              return Padding(
                padding: const EdgeInsets.only(left: 2.0, right: 4),
                child: profilecard(
                  LawyerName: snapshot.child('username').value.toString(),
                  lawyercategory: snapshot
                      .child('extrainfo')
                      .child('category')
                      .value
                      .toString(),
                  finalRating: generateRandomNumberString(),
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => lawyerdetail(
                            lawyerName:
                                snapshot.child('username').value.toString(),
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
                            lawyerid: snapshot.child('Uid').value.toString(),
                            imageUrl:
                                snapshot.child('profile').value.toString(),
                          ),
                        ));
                  },
                  imageurl: snapshot.child('profile').value.toString(),
                ),
              );
            } else
              () {
                return Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: profilecard(
                    LawyerName: snapshot.child('username').value.toString(),
                    lawyercategory: snapshot
                        .child('extrainfo')
                        .child('category')
                        .value
                        .toString(),
                    finalRating: generateRandomNumberString(),
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => lawyerdetail(
                              lawyerName:
                                  snapshot.child('username').value.toString(),
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
                              lawyerid: snapshot.child('Uid').value.toString(),
                              imageUrl:
                                  snapshot.child('profile').value.toString(),
                            ),
                          ));
                    },
                    imageurl: snapshot.child('profile').value.toString(),
                  ),
                );
              };
          } else {
            return Text('No Lawyer Registered');
          }

          return SizedBox();
        });
  }
}
