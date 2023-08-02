import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:law_application/res/components/roundbutton.dart';
import 'package:law_application/utils/utils.dart';

import '../../services/session_manager.dart';

// ignore: must_be_immutable
class C_casedescriptionpage extends StatefulWidget {
  String location;
  String username;
  String phonenumber;
  String lawyerid;
  String Clientid;
  C_casedescriptionpage(
      {super.key,
      required this.username,
      required this.location,
      required this.phonenumber,
      required this.lawyerid,
      required this.Clientid});

  @override
  State<C_casedescriptionpage> createState() => _C_casedescriptionpageState();
}

class _C_casedescriptionpageState extends State<C_casedescriptionpage> {
  TextEditingController caseDescriptionController = TextEditingController();
  TextEditingController opponentname = TextEditingController();
  TextEditingController clientname = TextEditingController();
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('User');
  DatabaseReference lawyerref = FirebaseDatabase.instance.ref().child('lawyer');

  String id = DateTime.now().microsecondsSinceEpoch.toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Case Description'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Please provide a detailed description of your case:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: caseDescriptionController,
              decoration: InputDecoration(
                labelText: 'Case Description',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            Text(
              'Opponent Name',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            ListTile(
                leading: Icon(Icons.person),
                title: TextFormField(
                  controller: opponentname,
                  decoration: InputDecoration(
                    labelText: 'Opponent Name',
                    border: OutlineInputBorder(),
                  ),
                )),
            SizedBox(height: 16),
            ListTile(
                leading: Icon(Icons.person),
                title: TextFormField(
                  controller: clientname,
                  decoration: InputDecoration(
                    labelText: 'Your Name',
                    border: OutlineInputBorder(),
                  ),
                )),
            SizedBox(height: 24),
            roundButton(
              onpress: () {
                ref
                    .child(SessionController().userid.toString())
                    .child('Case')
                    .child(id)
                    .set({
                  'date': DateTime.now().toString().split(' ')[0],
                  'id': id,
                  'casedes': caseDescriptionController.text,
                  'oppname': opponentname.text,
                  'clientname': clientname.text,
                  'lawyername': widget.username.toString(),
                  'location': widget.location.toString(),
                  'phone': widget.phonenumber.toString(),
                  'nexthearing': '',
                  'CaseDescription': '',
                  'clientID': widget.Clientid.toString(),
                });
                lawyerref.child(widget.lawyerid).child('Case').child(id).set({
                  'date': DateTime.now().toString().split(' ')[0],
                  'id': id,
                  'casedes': caseDescriptionController.text,
                  'oppname': opponentname.text,
                  'clientname': clientname.text,
                  'lawyername': widget.username.toString(),
                  'location': widget.location.toString(),
                  'phone': widget.phonenumber.toString(),
                  'nexthearing': '',
                  'CaseDescription': '',
                  'clientID': widget.Clientid.toString(),
                }).then((value) {
                  utils.toastmessage('Case Submit Succesfully');
                  Navigator.pop(context);
                });
              },
              title: 'Submit',
            ),
          ],
        ),
      ),
    );
  }
}
