import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:law_application/res/components/client%20card/popularlawyercard.dart';
import 'package:law_application/views/Lawyer/lawyer%20dashboard/lawyer%20home%20screen/lawyer_detail.dart';

class Fullpopularlawyerlist extends StatelessWidget {
  const Fullpopularlawyerlist({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    DatabaseReference ref = FirebaseDatabase.instance.ref().child('lawyer');
    return FirebaseAnimatedList(
      scrollDirection: Axis.horizontal,
      query: ref,
      itemBuilder: (BuildContext context, DataSnapshot snapshot,
          Animation<double> animation, int index) {
        double generateRandomNumberString() {
          Random random = Random();
          double randomNumber = random.nextDouble() * (5.0 - 3.0) +
              3.0; // Generate a random number between 3.0 and 5.0
          return double.parse(randomNumber.toStringAsFixed(1));
        }

        if (snapshot.exists) {
          return FullProfileCard(
            workinghour: '\$' +
                snapshot
                    .child('extrainfo')
                    .child('feeperhour')
                    .value
                    .toString() +
                '/hr',
            imageUrl: snapshot.child('profile').value.toString(),
            LawyerName: snapshot.child('username').value.toString(),
            location:
                snapshot.child('extrainfo').child('address').value.toString(),
            experience: snapshot
                .child('extrainfo')
                .child('practicing')
                .value
                .toString(),
            ontap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => lawyerdetail(
                      lawyerName: snapshot.child('username').value.toString(),
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
                      imageUrl: snapshot.child('profile').value.toString(),
                    ),
                  ));
            },
          );
        } else {
          return Text('No Lawyer Registered');
        }
      },
    );
  }
}
