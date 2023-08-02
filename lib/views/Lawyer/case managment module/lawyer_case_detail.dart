import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:law_application/utils/utils.dart';

import '../../../res/colors.dart';
import '../../services/session_manager.dart';

class CourtCasePage extends StatefulWidget {
  CourtCasePage(
      {super.key,
      required this.casenumber,
      required this.casetitle,
      required this.court,
      required this.startingdate,
      required this.opname,
      required this.clientname,
      required this.hearingstatus,
      required this.judgeremarks,
      required this.clientid});
  final String casenumber;
  final String casetitle;
  final String court;
  final String startingdate;
  final String opname;
  final String clientname;
  final String hearingstatus;
  final String judgeremarks;
  final String clientid;

  @override
  State<CourtCasePage> createState() => _CourtCasePageState();
}

class _CourtCasePageState extends State<CourtCasePage> {
  final edithearingstatus = TextEditingController();

  final editjudgemarks = TextEditingController();
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('User');
  DatabaseReference lawyerref = FirebaseDatabase.instance.ref().child('lawyer');

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Court Case Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: AppColors.primaryColor.withOpacity(0.2),
                      blurRadius: 2,
                      spreadRadius: 4,
                      offset: Offset(0, 4))
                ]),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Case Number:' + widget.casenumber,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Case Title:' + widget.casetitle,
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Court : ' + widget.court,
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Starting Date:' + widget.startingdate,
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Parties Involved:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text(widget.opname),
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text(widget.clientname),
                  ),
                  SizedBox(height: 24),
                  ListTile(
                    leading: Text(
                      'Hearing Status',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          _showCaseUpdateDialogue(
                              widget.hearingstatus, widget.judgeremarks);
                        },
                        icon: Icon(Icons.edit)),
                  ),
                  SizedBox(height: 8),
                  ListTile(
                      leading: Icon(Icons.calendar_month),
                      title: Text('Next Hearing'),
                      trailing: Text(widget.hearingstatus)),
                  ListTile(
                    leading: Text(
                      'Previous Hearing Decision',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.judgeremarks,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 24),

                  // Add more widgets as needed for additional case information.
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showCaseUpdateDialogue(
      String hearingstatus, judgestatus) async {
    edithearingstatus.text = hearingstatus;
    editjudgemarks.text = judgestatus;

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
                      controller: edithearingstatus,
                      maxLines: 1,
                      decoration: InputDecoration(
                          hintText: 'Next Hearing Date',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: editjudgemarks,
                      maxLines: 1,
                      decoration: InputDecoration(
                          hintText: 'Judge Decision',
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
                  lawyerref
                      .child(SessionController().userid.toString())
                      .child('Case')
                      .child(widget.casenumber)
                      .update({
                    'nexthearing': edithearingstatus.text.toLowerCase(),
                    'CaseDescription': editjudgemarks.text.toLowerCase()
                  });
                  ref
                      .child(widget.clientid)
                      .child('Case')
                      .child(widget.casenumber)
                      .update({
                    'nexthearing': edithearingstatus.text.toLowerCase(),
                    'CaseDescription': editjudgemarks.text.toLowerCase(),
                  }).then((value) {
                    Navigator.pop(context);
                    utils.toastmessage('Information Updated');
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
