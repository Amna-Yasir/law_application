import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../utils/routes/routesname.dart';
import '../../../utils/utils.dart';

class forgotpassword with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  bool _loading = false;
  bool get loading => _loading;

  setloaading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void forgotPassword(String emailaddress, BuildContext context) {
    setloaading(true);
    try {
      auth.sendPasswordResetEmail(email: emailaddress).then((value) {
        Navigator.pushNamed(context, RouteName.clientloginView);
        setloaading(false);
        utils
            .toastmessage('Password Change Successfully')
            .onError((error, stackTrace) {
          setloaading(false);
          utils.toastmessage(error);
        });
      });
    } catch (e) {
      setloaading(false);
      utils.toastmessage(e.toString());
    }
  }
}
