import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:law_application/utils/utils.dart';

import '../../../res/components/roundbutton.dart';
import '../../../utils/routes/routesname.dart';
import '../../services/session_manager.dart';

class editprofile extends StatefulWidget {
  editprofile(
      {required this.phone,
      required this.address,
      required this.zipCode,
      required this.hourlyrate,
      required this.aboutyourself,
      required this.currentlyworking,
      super.key});

  String phone, address, zipCode, hourlyrate, aboutyourself, currentlyworking;

  @override
  State<editprofile> createState() => _editprofileState();
}

class _editprofileState extends State<editprofile> {
  FirebaseAuth auth = FirebaseAuth.instance;

  DatabaseReference ref = FirebaseDatabase.instance.ref().child('lawyer');

  final editcategory = TextEditingController();

  final editphonenumber = TextEditingController();

  final editzipcode = TextEditingController();

  final editfeeperhour = TextEditingController();

  final editcurrentPracticing = TextEditingController();

  final editaddress = TextEditingController();

  final editaboutyourself = TextEditingController();

  @override
  Widget build(BuildContext context) {
    editphonenumber.text = widget.phone;
    editaboutyourself.text = widget.aboutyourself;
    editzipcode.text = widget.zipCode;
    editaddress.text = widget.address;
    editcurrentPracticing.text = widget.currentlyworking;
    editfeeperhour.text = widget.hourlyrate;

    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Personal Information',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Please fill out the following section it is manadatory. So your client can check all of your details',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              child: TextFormField(
                // controller: ,
                maxLines: 1,
                decoration: InputDecoration(
                    hintText: 'Category',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: editphonenumber,
                maxLines: 1,
                decoration: InputDecoration(
                    hintText: 'Phone Number',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: editzipcode,
                maxLines: 1,
                decoration: InputDecoration(
                    hintText: 'Zip Code',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: editfeeperhour,
                maxLines: 1,
                decoration: InputDecoration(
                    hintText: 'Fee Per Hour',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: editcurrentPracticing,
                maxLines: 1,
                decoration: InputDecoration(
                    hintText: 'Current Practicing At?',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: editaddress,
                maxLines: 2,
                decoration: InputDecoration(
                    hintText: 'Address',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: editaboutyourself,
                maxLines: 4,
                decoration: InputDecoration(
                    hintText: 'About Yourself',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            roundButton(
                title: 'Edit',
                onpress: () {
                  ref
                      .child(SessionController().userid.toString())
                      .child('extrainfo')
                      .update({
                    'Phone': editphonenumber.text.toLowerCase(),
                    'ZipCode': editzipcode.text.toLowerCase(),
                    'feeperhour': editfeeperhour.text.toLowerCase(),
                    'practicing': editcurrentPracticing.text.toLowerCase(),
                    'address': editaddress.text.toLowerCase(),
                    'aboutyourself': editaboutyourself.text.toLowerCase()
                  }).then((value) {
                    Navigator.pop(context);
                    utils.toastmessage('Save Successfully');

                    Navigator.pushNamed(context, RouteName.lawyerProfileView);
                  }).onError((error, stackTrace) {
                    error.toString();
                  }).then((value) {});
                })
          ],
        ),
      ),
    ));
  }
}

// class editprofile {
//   Future<Widget> showupdatedialogue(String phone, address, zipCode, hourlyrate,
//       aboutyourself, currentlyworking) async {
   
//     Widget build(BuildContext context) {
//       return 
//     }

//     throw '';
//   }

  // return await showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: Text('Edit Task'),
  //         content: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             TextFormField(
  //               controller: edittitlecontroller,
  //               decoration: const InputDecoration(
  //                 hintText: 'Edit title',
  //                 border: OutlineInputBorder(),
  //               ),
  //             ),
  //             const SizedBox(height: 10),
  //             TextFormField(
  //               controller: editdescriptioncontroller,
  //               decoration: const InputDecoration(
  //                 hintText: 'Edit Description',
  //                 border: OutlineInputBorder(),
  //               ),
  //             ),
  //           ],
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               ref.child(id).update({
  //                 'title': edittitlecontroller.text.toLowerCase(),
  //                 'des': editdescriptioncontroller.text.toLowerCase()
  //               }).then((value) {
  //                 utils.toastmessage('Task update');
  //               }).onError((error, stackTrace) {
  //                 utils.toastmessage(e.toString());
  //               }).then((value) {
  //                 Navigator.pop(context);
  //               });
  //             },
  //             child: Text('Edit'),
  //           ),
  //           TextButton(onPressed: () {}, child: Text('Cancel'))
  //         ],
  //       );

  //     });

