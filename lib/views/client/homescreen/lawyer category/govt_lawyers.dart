import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import 'categorydetailwidget.dart';

import '../lawyer_detail.dart';

class c_govt_category extends StatefulWidget {
  const c_govt_category({super.key});

  @override
  State<c_govt_category> createState() => _c_govt_categoryState();
}

class _c_govt_categoryState extends State<c_govt_category> {
  final serachfilter = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DatabaseReference ref = FirebaseDatabase.instance.ref().child('lawyer');

    return Scaffold(
        appBar: AppBar(
          title: const Text('Law Firm'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            children: [
              Text(
                'Goverment Lawyers of Law Firm',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Expanded(
                child: FirebaseAnimatedList(
                  query: ref,
                  itemBuilder: (BuildContext context, DataSnapshot snapshot,
                      Animation<double> animation, int index) {
                    String category = snapshot
                        .child('extrainfo')
                        .child('category')
                        .value
                        .toString();
                    if (snapshot.exists) {
                      double generateRandomNumberString() {
                        Random random = Random();
                        double randomNumber = random.nextDouble() *
                                (5.0 - 3.0) +
                            3.0; // Generate a random number between 3.0 and 5.0
                        return double.parse(randomNumber.toStringAsFixed(1));
                      }

                      if (category == 'govt') {
                        return categoryDetailwidget(
                          lawyeraddress: snapshot
                              .child('extrainfo')
                              .child('address')
                              .value
                              .toString(),
                          LawyerName:
                              snapshot.child('username').value.toString(),
                          imageurl: snapshot.child('profile').value.toString(),
                          ontap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => client_lawyer_detail(
                                          lawyerName: snapshot
                                              .child('username')
                                              .value
                                              .toString(),
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
                                          lawyerid: snapshot
                                              .child('Uid')
                                              .value
                                              .toString(),
                                          imageUrl: snapshot
                                              .child('profile')
                                              .value
                                              .toString(),
                                          description: snapshot
                                              .child('extrainfo')
                                              .child('aboutyourself')
                                              .value
                                              .toString(),
                                        )));
                          },
                        );
                      } else
                        () {
                          return Text('no lawyer found');
                        };
                    }
                    return Column();
                  },
                ),
              )
            ],
          ),
        ));
  }
}
