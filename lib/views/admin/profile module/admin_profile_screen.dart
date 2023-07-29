// ignore_for_file: unused_local_variable

import 'dart:io';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:law_application/utils/routes/routesname.dart';
import 'package:law_application/views/client/dashboard/profilescreen/profile_screen_controller.dart';

import 'package:law_application/views/services/session_manager.dart';
import 'package:provider/provider.dart';
import '../../../../utils/utils.dart';
import '../../../../res/colors.dart';
import '../../../../res/components/textfield and row/reusablerow.dart';

class admin_profilescreen extends StatefulWidget {
  const admin_profilescreen({super.key});

  @override
  State<admin_profilescreen> createState() => _admin_profilescreenState();
}

class _admin_profilescreenState extends State<admin_profilescreen> {
  final editusernamecontroller = TextEditingController();
  final editemailcontroller = TextEditingController();
  final editphonecontroller = TextEditingController();
  final editadddressontroller = TextEditingController();

  final locationcontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  final locationdocusnode = FocusNode();
  bool loading = true;
  FirebaseAuth auth = FirebaseAuth.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('admin');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth auth = FirebaseAuth.instance;
                auth.signOut().then((value) {
                  SessionController().userid = '';
                  Navigator.pushNamed(context, RouteName.usermanagerView);
                });
              },
              icon: Icon(Icons.logout_outlined))
        ],
      ),
      body: ChangeNotifierProvider(
          create: (_) => clientprofilecontroller(),
          child: Consumer<clientprofilecontroller>(
            builder: (context, provider, child) {
              return SingleChildScrollView(
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
                                  return Center(
                                      child: CircularProgressIndicator());
                                } else if (snapshot.hasData) {
                                  Map<dynamic, dynamic> map =
                                      snapshot.data.snapshot.value;
                                  final username = map['username'];
                                  final email = map['email'];
                                  final phone = map['phone'];
                                  final address = map['address'];

                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Center(
                                        child: Column(
                                          children: [
                                            Stack(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                children: [
                                                  Container(
                                                    height: 130,
                                                    width: 130,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                            color: AppColors
                                                                .secondaryTextColor,
                                                            width: 4)),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                      child: provider.image ==
                                                              null
                                                          ? map['Profilepicture']
                                                                      .toString() ==
                                                                  ''
                                                              ? const Icon(
                                                                  Icons.person)
                                                              : Image(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image: NetworkImage(
                                                                      map['Profilepicture']
                                                                          .toString()),
                                                                  loadingBuilder:
                                                                      (context,
                                                                          child,
                                                                          loadingProgress) {
                                                                    if (loadingProgress ==
                                                                        null)
                                                                      return child;
                                                                    return const Center(
                                                                        child:
                                                                            CircularProgressIndicator());
                                                                  },
                                                                )
                                                          : Image.file(
                                                              File(provider
                                                                      .image!
                                                                      .path)
                                                                  .absolute,
                                                              fit: BoxFit.cover,
                                                            ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      provider
                                                          .pickimage(context);
                                                    },
                                                    child: CircleAvatar(
                                                      radius: 14,
                                                      backgroundColor: AppColors
                                                          .primaryColor,
                                                      child: Icon(
                                                        Icons.add,
                                                        color: Colors.white,
                                                        size: 18,
                                                      ),
                                                    ),
                                                  )
                                                ]),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: AppColors.grayColor),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        child: Padding(
                                          padding: const EdgeInsets.all(11.0),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Basic Information',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headlineMedium,
                                                  ),
                                                  PopupMenuButton(
                                                      itemBuilder: (context) =>
                                                          [
                                                            PopupMenuItem(
                                                                child: ListTile(
                                                              onTap: () {
                                                                _showupdatedialogue(
                                                                    username,
                                                                    email,
                                                                    address,
                                                                    phone);
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              leading: Icon(
                                                                  Icons.edit),
                                                              title:
                                                                  Text('Edit'),
                                                            )),
                                                          ])
                                                ],
                                              ),
                                              reusableRow(
                                                  leadingicon: Icons.person,
                                                  value: map['username'],
                                                  title: 'Username'),
                                              reusableRow(
                                                  leadingicon:
                                                      Icons.email_outlined,
                                                  value: map['email'],
                                                  title: 'Email'),
                                              reusableRow(
                                                  leadingicon:
                                                      Icons.location_on,
                                                  value: map['address'],
                                                  title: 'Address'),
                                              reusableRow(
                                                  leadingicon: Icons.phone,
                                                  value: map['Phone'],
                                                  title: 'Phone'),
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
                  ],
                ),
              );
            },
          )),
    );
  }

  Future<void> _showupdatedialogue(
      String username, String email, String address, String phone) async {
    editusernamecontroller.text = username;
    editemailcontroller.text = email;
    editadddressontroller.text = address;
    editphonecontroller.text = phone;
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
                TextFormField(
                  controller: editadddressontroller,
                  decoration: const InputDecoration(
                    hintText: 'Edit address',
                    border: OutlineInputBorder(),
                  ),
                ),
                TextFormField(
                  controller: editphonecontroller,
                  decoration: const InputDecoration(
                    hintText: 'Edit phone',
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
                    'email': editemailcontroller.text.toLowerCase(),
                    'address': editadddressontroller.text.toLowerCase(),
                    'Phone': editphonecontroller.text.toLowerCase()
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
