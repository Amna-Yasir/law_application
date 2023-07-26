import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../../../utils/utils.dart';

import '../../../utils/routes/routesname.dart';
import '../../services/session_manager.dart';

class admin_loginController with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('admin');
  final role = FirebaseDatabase.instance.ref().child('role');

  bool _loading = false;
  bool get loading => _loading;

  setloaading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void login(BuildContext context, String emailaddress, String Password) async {
    setloaading(true);

    try {
      auth
          .signInWithEmailAndPassword(
              email: emailaddress.trim(), password: Password.trim())
          .then((value) async {
        SessionController().userid = value.user!.uid.toString();

        utils.toastmessage('Succesfully');
        Navigator.pushNamed(context, RouteName.admindashboardView);
      }).onError((error, stackTrace) {
        print(error);
        setloaading(false);
        utils.toastmessage(error.toString());
      });
    } catch (e) {
      setloaading(false);
      utils.toastmessage(e.toString());
    }
  }
}
