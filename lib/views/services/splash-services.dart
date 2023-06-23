// ignore_for_file: unused_local_variable

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:law_application/views/services/session_manager.dart';

import '../../utils/routes/routesname.dart';

class splashServices {
  void isLogin(BuildContext context) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    DatabaseReference ref = FirebaseDatabase.instance.ref().child('User');

    if (user != null) {
      SessionController().userid = user.uid.toString();

      Timer(Duration(seconds: 3),
          () => Navigator.pushNamed(context, RouteName.lawyerdashboardView));
    } else {
      Timer(Duration(seconds: 3),
          () => Navigator.pushNamed(context, RouteName.lawyerloginView));
    }
  }

  void clientlogin(BuildContext context) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    if (user != null) {
      SessionController().userid = user.uid.toString();

      Timer(Duration(seconds: 3),
          () => Navigator.pushNamed(context, RouteName.dashboardView));
    } else {
      Timer(Duration(seconds: 3),
          () => Navigator.pushNamed(context, RouteName.loginView));
    }
  }
}
