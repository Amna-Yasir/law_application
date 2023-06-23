// ignore_for_file: unused_local_variable

import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:law_application/res/components/roundbutton.dart';
import 'package:law_application/utils/routes/routesname.dart';
import 'package:law_application/views/services/session_manager.dart';
import '../../../../utils/utils.dart';
import '../../../../res/colors.dart';
import '../../../../res/components/reusablerow.dart';

class profilescreen extends StatefulWidget {
  const profilescreen({super.key});

  @override
  State<profilescreen> createState() => _profilescreenState();
}

class _profilescreenState extends State<profilescreen> {
  final editusernamecontroller = TextEditingController();
  final editemailcontroller = TextEditingController();
  final editphonecontroller = TextEditingController();
  final editadddressontroller = TextEditingController();

  final locationcontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  final locationdocusnode = FocusNode();
  bool loading = true;
  FirebaseAuth auth = FirebaseAuth.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('User');
  DatabaseReference inforef = FirebaseDatabase.instance.ref().child('User');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SafeArea(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: StreamBuilder(
                      stream: ref
                          .child(SessionController().userid.toString())
                          .onValue,
                      builder: (context, AsyncSnapshot snapshot) {
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasData) {
                          Map<dynamic, dynamic> map =
                              snapshot.data.snapshot.value;
                          final username = map['username'];
                          final email = map['email'];

                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: Column(
                                  children: [
                                    Container(
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: Image(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                'https://images.pexels.com/photos/3781545/pexels-photo-3781545.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2')),
                                      ),
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color:
                                                  AppColors.secondaryTextColor,
                                              width: 4)),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: Text('Edit Profile',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  decoration: TextDecoration
                                                      .underline)),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: AppColors.grayColor),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Padding(
                                  padding: const EdgeInsets.all(11.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Basic Information',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium,
                                          ),
                                          PopupMenuButton(
                                              itemBuilder: (context) => [
                                                    PopupMenuItem(
                                                        child: ListTile(
                                                      onTap: () {
                                                        _showupdatedialogue(
                                                            username, email);
                                                        Navigator.pop(context);
                                                      },
                                                      leading: Icon(Icons.edit),
                                                      title: Text('Edit'),
                                                    )),
                                                  ])
                                        ],
                                      ),
                                      reusableRow(
                                          leadingicon: Icons.person,
                                          value: map['username'],
                                          title: 'Username'),
                                      reusableRow(
                                          leadingicon: Icons.email_outlined,
                                          value: map['email'],
                                          title: 'Email'),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          );
                        } else {
                          return Text('Something Went Wrong');
                        }
                      })),
            ),
            // StreamBuilder(
            //   stream: ref.child(SessionController().userid.toString()).onValue,
            //   builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            //     Map<dynamic, dynamic> map = snapshot.data.snapshot.value;
            //     final phone = map['phone'];
            //     final address = map['address'];
            //     if (!snapshot.hasData) {
            //       return CircularProgressIndicator();
            //     } else if (snapshot.hasData) {
            //       return Padding(
            //         padding: const EdgeInsets.symmetric(horizontal: 15),
            //         child: Container(
            //           decoration: BoxDecoration(
            //               border: Border.all(color: AppColors.grayColor),
            //               borderRadius: BorderRadius.all(Radius.circular(10))),
            //           child: Padding(
            //             padding: const EdgeInsets.all(11.0),
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Row(
            //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                   children: [
            //                     Text(
            //                       'Personal Information',
            //                       style: Theme.of(context)
            //                           .textTheme
            //                           .headlineMedium,
            //                     ),
            //                     PopupMenuButton(
            //                         itemBuilder: (context) => [
            //                               PopupMenuItem(
            //                                   child: ListTile(
            //                                 onTap: () {
            //                                   _personalInformation(context);
            //                                 },
            //                                 leading: Icon(Icons.add),
            //                                 title: Text('Add'),
            //                               )),
            //                               PopupMenuItem(
            //                                   child: ListTile(
            //                                 onTap: () {
            //                                   _showinfoupdatedialogue(
            //                                       address, phone);
            //                                 },
            //                                 leading: Icon(Icons.edit),
            //                                 title: Text('Edit'),
            //                               )),
            //                             ])
            //                   ],
            //                 ),
            //                 reusableRow(
            //                     leadingicon: Icons.location_on_outlined,
            //                     value: map['address'],
            //                     title: 'Address'),
            //                 reusableRow(
            //                     leadingicon: Icons.phone,
            //                     value: map['phone'],
            //                     title: 'Phone'),
            //               ],
            //             ),
            //           ),
            //         ),
            //       );
            //     } else {
            //       Text('Something went wrong');
            //     }
            //     throw '';
            //   },
            // ),
            roundButton(
                title: 'Signout',
                onpress: () {
                  FirebaseAuth auth = FirebaseAuth.instance;
                  final user = auth.signOut().then((value) => {
                        SessionController().userid = '',
                        Navigator.pushNamed(context, RouteName.loginView),
                        Navigator.pop(context)
                      });
                }),
          ],
        ),
      ),
    );
  }

  Future<void> _personalInformation(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add Personal Information'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: locationcontroller,
                  decoration: const InputDecoration(
                    hintText: 'Add address',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: phonecontroller,
                  decoration: const InputDecoration(
                    hintText: 'Add Phone number',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  ref
                      .child(SessionController().userid.toString())
                      .child('personalinfo')
                      .set({
                    'Address': locationcontroller.text,
                    'Phone number': phonecontroller.text,
                  }).then((value) {
                    utils.toastmessage('Task added');
                    setState(() {
                      loading = false;
                    });
                  }).onError((error, stackTrace) {
                    error.toString();
                  }).then((value) {
                    Navigator.pop(context);
                    phonecontroller.clear();
                    locationcontroller.clear();
                  });
                },
                child: Text('Add'),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'))
            ],
          );
        });
  }

  Future<void> _showupdatedialogue(String username, String email) async {
    editusernamecontroller.text = username;
    editemailcontroller.text = email;
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Edit Informatiom'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: editusernamecontroller,
                  decoration: const InputDecoration(
                    hintText: 'Edit username',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: editemailcontroller,
                  decoration: const InputDecoration(
                    hintText: 'Edit email',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  ref.child(SessionController().userid.toString()).update({
                    'username': editusernamecontroller.text.toLowerCase(),
                    'email': editemailcontroller.text.toLowerCase()
                  }).then((value) {
                    utils.toastmessage('Information Update');
                  }).onError((error, stackTrace) {
                    utils.toastmessage(e.toString());
                  }).then((value) {
                    Navigator.pop(context);
                  });
                },
                child: Text(
                  'Edit',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Cancel',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              )
            ],
          );
        });
  }

  Future<void> _showinfoupdatedialogue(String address, String phone) async {
    editphonecontroller.text = phone;
    editadddressontroller.text = address;
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Edit Informatiom'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: editphonecontroller,
                  decoration: const InputDecoration(
                    hintText: 'Edit phone',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: editadddressontroller,
                  decoration: const InputDecoration(
                    hintText: 'Edit address',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  ref
                      .child(SessionController().userid.toString())
                      .child('personalinfo')
                      .update({
                    'Address': editadddressontroller.text.toLowerCase(),
                    'Phone number': editphonecontroller.text.toLowerCase()
                  }).then((value) {
                    utils.toastmessage('Information Update');
                  }).onError((error, stackTrace) {
                    utils.toastmessage(e.toString());
                  }).then((value) {
                    Navigator.pop(context);
                  });
                },
                child: Text(
                  'Edit',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Cancel',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              )
            ],
          );
        });
  }
}
