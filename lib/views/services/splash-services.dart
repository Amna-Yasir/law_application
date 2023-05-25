import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:law_application/views/services/session_manager.dart';

import '../../utils/routes/routesname.dart';

// ignore: camel_case_types
class splashservices {
  void isLogin(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if (user != null) {
      SessionController().userid = user.uid.toString();
      Timer(Duration(seconds: 5),
          () => Navigator.pushNamed(context, RouteName.dashboardView));
    } else {
      Timer(Duration(seconds: 3),
          () => Navigator.pushNamed(context, RouteName.usermanagerView));
    }
  }
}
