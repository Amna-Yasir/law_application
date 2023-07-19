import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:law_application/views/Lawyer/lawyer%20dashboard/lawyer%20home%20screen/lawyer_detail.dart';

import '../categorydetailwidget.dart';

class tax_category extends StatefulWidget {
  const tax_category({super.key});

  @override
  State<tax_category> createState() => _tax_categoryState();
}

class _tax_categoryState extends State<tax_category> {
  final serachfilter = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DatabaseReference ref = FirebaseDatabase.instance.ref().child('lawyer');

    return Scaffold(
        appBar: AppBar(
          title: const Text('Tax Lawyers'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    controller: serachfilter,
                    onChanged: (value) {
                      setState(() {});
                    },
                    decoration: const InputDecoration(
                        hintText: 'Search',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  ),
                ),
              ),
              Expanded(
                child: FirebaseAnimatedList(
                  defaultChild: Text('No Lawyer Found'),
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

                      if (category == 'Tax') {
                        return categoryDetailwidget(
                          lawyeraddress: snapshot
                              .child('extrainfo')
                              .child('address')
                              .value
                              .toString(),
                          LawyerName:
                              snapshot.child('username').value.toString(),
                          imageurl:
                              'https://images.unsplash.com/photo-1568602471122-7832951cc4c5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
                          ontap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => lawyerdetail(
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
