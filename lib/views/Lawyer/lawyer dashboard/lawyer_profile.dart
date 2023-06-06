import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:law_application/DialogueBoxes/dialogueboxes.dart';
import 'package:law_application/res/components/roundbutton.dart';
import 'package:law_application/views/Lawyer/lawyer%20dashboard/lawyer_extra_info.dart';
import 'package:law_application/views/Lawyer/lawyer%20dashboard/edit_profile.dart';
import '../../../../utils/utils.dart';

import '../../../res/colors.dart';
import '../../../res/components/reusablerow.dart';
import '../../services/session_manager.dart';

class lawyerprofile extends StatefulWidget {
  const lawyerprofile({super.key});

  @override
  State<lawyerprofile> createState() => _lawyerprofileState();
}

class _lawyerprofileState extends State<lawyerprofile> {
  final editcategory = TextEditingController();

  final editphonenumber = TextEditingController();

  final editzipcode = TextEditingController();

  final editfeeperhour = TextEditingController();

  final editcurrentPracticing = TextEditingController();

  final editaddress = TextEditingController();

  final editaboutyourself = TextEditingController();
  bool loading = true;
  FirebaseAuth auth = FirebaseAuth.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('lawyer');

  @override
  Widget build(BuildContext context) {
    dialogueboxes boxes = dialogueboxes();
    return Scaffold(
      appBar: AppBar(
        title: Text('Lawyer Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
        child: SingleChildScrollView(
          child: Expanded(
            child: Column(
              children: [
                StreamBuilder(
                    stream: ref
                        .child(SessionController().userid.toString())
                        .onValue,
                    builder: (context, AsyncSnapshot snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasData) {
                        Map<dynamic, dynamic> map =
                            snapshot.data.snapshot.value;

                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Column(
                                children: [
                                  Container(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              'https://images.pexels.com/photos/3781545/pexels-photo-3781545.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2')),
                                    ),
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: AppColors.primaryColor,
                                            width: 4)),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text('Edit Profile',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                                decoration:
                                                    TextDecoration.underline)),
                                  )
                                ],
                              ),
                            ),
                            contentRow(
                              titleName: 'Name',
                              content: map['username'],
                            ),
                            contentRow(
                              titleName: 'Email',
                              content: map['email'],
                            ),
                          ],
                        );
                      } else {
                        return Text('Something Went Wrong');
                      }
                    }),
                StreamBuilder(
                    stream: ref
                        .child(SessionController().userid.toString())
                        .child('extrainfo')
                        .onValue,
                    builder: (context, AsyncSnapshot snapshot) {
                      if (!snapshot.hasData) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasData) {
                        Map<dynamic, dynamic> map =
                            snapshot.data.snapshot.value;
                        final phone = map['Phone'];
                        final category = map['category'];
                        final address = map['address'];
                        final zipCode = map['ZipCode'];
                        final hourlyrate = map['feeperhour'];
                        final aboutyourself = map['aboutyourself'];
                        final currentlyworking = map['practicing'];
                        return Column(
                          children: [
                            contentRow(
                                content: map['Phone'],
                                titleName: 'Phone Number'),
                            contentRow(
                                content: map['address'], titleName: 'Address'),
                            contentRow(
                                content: map['ZipCode'], titleName: 'Zip Code'),
                            contentRow(
                                content: map['category'],
                                titleName: 'Category'),
                            contentRow(
                                content: map['feeperhour'],
                                titleName: 'Hourly Rate'),
                            contentRow(
                                content: map['aboutyourself'],
                                titleName: 'About Yourself'),
                            contentRow(
                                content: map['practicing'],
                                titleName: 'Currently Working'),
                            Align(
                              alignment: Alignment.topRight,
                              child: TextButton(
                                child: Text(
                                  'Edit',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(color: AppColors.primaryColor),
                                ),
                                onPressed: () {
                                  _showinfoupdatedialogue(
                                    phone,
                                    address,
                                    zipCode,
                                    category,
                                    hourlyrate,
                                    aboutyourself,
                                    currentlyworking,
                                  );
                                  // edit.showupdatedialogue(
                                  //     phone,
                                  //     address,
                                  //     zipCode,
                                  //     hourlyrate,
                                  //     aboutyourself,
                                  //     currentlyworking);
                                },
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Text('Something Went Wrong');
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showinfoupdatedialogue(String phone, address, zipCode, category,
      hourlyrate, aboutyourself, currentlyworking) async {
    editcategory.text = category;
    editphonenumber.text = phone;
    editaboutyourself.text = aboutyourself;
    editzipcode.text = zipCode;
    editaddress.text = address;
    editcurrentPracticing.text = currentlyworking;
    editfeeperhour.text = hourlyrate;
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            insetPadding: EdgeInsets.all(20),
            scrollable: true,
            title: Text('Edit Informatiom'),
            content: SingleChildScrollView(
              child: Container(
                width: 300,
                child: Column(
                  children: [
                    TextFormField(
                      controller: editcategory,
                      maxLines: 1,
                      decoration: InputDecoration(
                          hintText: 'Category',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: editphonenumber,
                      maxLines: 1,
                      decoration: InputDecoration(
                          hintText: 'Phone Number',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: editzipcode,
                      maxLines: 1,
                      decoration: InputDecoration(
                          hintText: 'Zip Code',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: editfeeperhour,
                      maxLines: 1,
                      decoration: InputDecoration(
                          hintText: 'Fee Per Hour',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: editcurrentPracticing,
                      maxLines: 1,
                      decoration: InputDecoration(
                          hintText: 'Current Practicing At?',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: editaddress,
                      maxLines: 2,
                      decoration: InputDecoration(
                          hintText: 'Address',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: editaboutyourself,
                      maxLines: 4,
                      decoration: InputDecoration(
                          hintText: 'About Yourself',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  ref
                      .child(SessionController().userid.toString())
                      .child('extrainfo')
                      .update({
                    'category': editcategory.text.toLowerCase(),
                    'Phone': editphonenumber.text.toLowerCase(),
                    'ZipCode': editzipcode.text.toLowerCase(),
                    'feeperhour': editfeeperhour.text.toLowerCase(),
                    'practicing': editcurrentPracticing.text.toLowerCase(),
                    'address': editaddress.text.toLowerCase(),
                    'aboutyourself': editaboutyourself.text.toLowerCase()
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

class contentRow extends StatelessWidget {
  contentRow({
    required this.content,
    required this.titleName,
    super.key,
  });
  String content;
  String titleName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            titleName,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 232, 230, 230),
                borderRadius: BorderRadius.circular(30)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child:
                  Text(content, style: Theme.of(context).textTheme.bodyLarge!),
            ),
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
