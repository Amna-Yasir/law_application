import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:law_application/res/components/card/popularlawyercard.dart';
import 'package:law_application/views/Lawyer/lawyer%20dashboard/lawyer%20home%20screen/lawyer_detail.dart';

class popularlawyerlist extends StatelessWidget {
  const popularlawyerlist({
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
            experience: '14 years Experience',
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
    // return ListView(
    //   scrollDirection: Axis.horizontal,
    //   children: const [
    //     FullProfileCard(
    //       workinghour: '\$15.00/hr',
    //       location: 'Lahore',
    //       imageUrl:
    //           'https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    //       experience: '14 Years Experience',
    //       LawyerName: 'Leyla Erdem',
    //     ),
    //     SizedBox(
    //       width: 10,
    //     ),
    //     FullProfileCard(
    //       workinghour: '\$19.00/hr',
    //       location: 'Islamabad',
    //       imageUrl:
    //           'https://images.unsplash.com/photo-1621784562877-e971f1f79f47?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
    //       experience: '19 Years Experience',
    //       LawyerName: 'Zara Erdem',
    //     ),
    //     SizedBox(
    //       width: 10,
    //     ),
    //     FullProfileCard(
    //       workinghour: '\$20.00/hr',
    //       location: 'Murree',
    //       imageUrl:
    //           'https://images.unsplash.com/photo-1605664041952-4a2855d9363b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80',
    //       experience: '19 Years Experience',
    //       LawyerName: 'Faisal Erdem',
    //     ),
    //     SizedBox(
    //       width: 10,
    //     ),
    //     FullProfileCard(
    //       workinghour: '\$16.00/hr',
    //       location: 'Gujrat',
    //       imageUrl:
    //           'https://images.unsplash.com/photo-1662104935883-e9dd0619eaba?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    //       experience: '6 Years Experience',
    //       LawyerName: 'Sara Khan',
    //     ),
    //     SizedBox(
    //       width: 10,
    //     ),
    //   ],
    // );
  }
}
