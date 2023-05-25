// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:law_application/res/components/roundbutton.dart';
import 'package:law_application/utils/utils.dart';
import 'package:law_application/views/services/session_manager.dart';

import '../../../utils/routes/routesname.dart';

class chatscreen extends StatefulWidget {
  const chatscreen({super.key});

  @override
  State<chatscreen> createState() => _chatscreenState();
}

class _chatscreenState extends State<chatscreen> {
  final databaseref = FirebaseDatabase.instance.ref('User');

  final postcontroller = TextEditingController();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('chat'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            TextFormField(
              controller: postcontroller,
              maxLines: 4,
              decoration: InputDecoration(
                  hintText: 'What\'s on your mind?',
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 20,
            ),
            roundButton(
                title: 'Signout',
                onpress: () {
                  FirebaseAuth auth = FirebaseAuth.instance;
                  final user = auth.signOut().then((value) => {
                        SessionController().userid = '',
                        Navigator.pushNamed(context, RouteName.loginView)
                      });
                }),
            roundButton(
                loading: loading,
                title: 'Add Post',
                onpress: () {
                  setState(() {
                    loading = true;
                  });

                  databaseref
                      .child(SessionController().userid.toString())
                      .child('post')
                      .child(DateTime.now().microsecondsSinceEpoch.toString())
                      .set({
                    'id': DateTime.now().microsecondsSinceEpoch,
                    'title': postcontroller.text
                  }).then((value) {
                    utils.toastmessage('Post added');
                    setState(() {
                      loading = false;
                    });
                  }).onError((error, stackTrace) {
                    e.toString();
                    setState(() {
                      loading = false;
                    });
                  });
                }),
          ],
        ),
      ),
    );
  }
}
