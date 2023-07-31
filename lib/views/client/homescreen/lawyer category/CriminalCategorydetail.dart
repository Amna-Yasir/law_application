import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:law_application/views/Lawyer/lawyer%20dashboard/lawyer%20home%20screen/categorydetailwidget.dart';
import 'package:law_application/views/client/homescreen/lawyer_detail.dart';

class C_CriminalCategorydetail extends StatefulWidget {
  const C_CriminalCategorydetail({super.key});

  @override
  State<C_CriminalCategorydetail> createState() =>
      _C_CriminalCategorydetailState();
}

class _C_CriminalCategorydetailState extends State<C_CriminalCategorydetail> {
  final serachfilter = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DatabaseReference ref = FirebaseDatabase.instance.ref().child('lawyer');

    return Scaffold(
        appBar: AppBar(
          title: const Text('Criminal Lawyers'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: serachfilter,
                    onChanged: (value) {
                      setState(() {});
                    },
                    decoration: const InputDecoration(
                        hintText: 'Search',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)))),
                  ),
                ),
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

                      if (category == 'criminal') {
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
                                    lawyerid:
                                        snapshot.child('Uid').value.toString(),
                                    imageUrl: snapshot
                                        .child('profile')
                                        .value
                                        .toString(),
                                  ),
                                ));
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
              // Expanded(
              //     child: GridView.count(
              //   padding: const EdgeInsets.symmetric(vertical: 25),
              //   mainAxisSpacing: 30,

              //   crossAxisCount: 2,
              //   // ignore: prefer_const_literals_to_create_immutables
              //   children: [
              //     const Expanded(
              //         child: categoryDetailwidget(
              //       LawyerName: 'Ali Ahmed',
              //       imageurl:
              //           'https://images.unsplash.com/photo-1568602471122-7832951cc4c5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
              //     )),
              //     const Expanded(
              //         child: categoryDetailwidget(
              //             LawyerName: 'Sara Ali',
              //             imageurl:
              //                 'https://images.unsplash.com/photo-1603988089669-c041ac2fe196?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80')),
              //     const Expanded(
              //         child: categoryDetailwidget(
              //       LawyerName: 'Raja Ahmed',
              //       imageurl:
              //           'https://images.unsplash.com/photo-1564564244660-5d73c057f2d2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=876&q=80',
              //     )),
              //     const Expanded(
              //         child: categoryDetailwidget(
              //       LawyerName: 'Erum Khalid',
              //       imageurl:
              //           'https://images.unsplash.com/photo-1564564295391-7f24f26f568b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=876&q=80',
              //     )),
              //     const Expanded(
              //         child: categoryDetailwidget(
              //       LawyerName: 'Alia Ahmed',
              //       imageurl:
              //           'https://images.unsplash.com/photo-1509967419530-da38b4704bc6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=895&q=80',
              //     )),
              //     const Expanded(
              //         child: categoryDetailwidget(
              //             LawyerName: 'Ali Rana',
              //             imageurl:
              //                 'https://images.unsplash.com/photo-1607346256330-dee7af15f7c5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=906&q=80')),
              //   ],
              // )),
            ],
          ),
        ));
  }
}
