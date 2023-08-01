import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:law_application/Chat/message_screen.dart';
import 'package:law_application/res/colors.dart';
import 'package:law_application/views/services/session_manager.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class complaint extends StatefulWidget {
  const complaint({super.key});

  @override
  State<complaint> createState() => _complaintState();
}

class _complaintState extends State<complaint> {
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('complaints');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: false,
        elevation: 0,
        title: Text(
          "Complaints",
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(top: 16, left: 16, right: 16),
        child: Column(children: [
          TextField(
            decoration: InputDecoration(
              hintText: "Search...",
              hintStyle: TextStyle(color: Colors.grey.shade600),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey.shade600,
                size: 20,
              ),
              filled: true,
              fillColor: Colors.grey.shade100,
              contentPadding: EdgeInsets.all(8),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.grey.shade100)),
            ),
          ),
          Expanded(
            child: FirebaseAnimatedList(
              query: ref,
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                if (SessionController().userid.toString() ==
                    snapshot.value.toString()) {
                  return Container();
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 5.0,
                                spreadRadius: 1.1)
                          ],
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Email:  ',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    snapshot
                                        .child(
                                          'email',
                                        )
                                        .value
                                        .toString(),
                                    style: TextStyle(fontSize: 20),
                                  )
                                ]),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Complaint:  ',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    snapshot
                                        .child('complaint')
                                        .value
                                        .toString(),
                                    style: TextStyle(fontSize: 20),
                                  )
                                ]),
                          ],
                        ),
                      ),
                    ),
                    // child: Card(
                    //   borderOnForeground: true,
                    //   shadowColor: AppColors.dividedColor,
                    //   child: ListTile(
                    //     trailing:
                    //         Text(snapshot.child('email').value.toString()),
                    //     title:
                    //         Text(snapshot.child('complaint').value.toString()),
                    //     subtitle:
                    //         Text(snapshot.child('Userid').value.toString()),
                    //   ),
                    // ),
                  );
                }
              },
            ),
          ),
        ]),
      )),
    );
  }
}
