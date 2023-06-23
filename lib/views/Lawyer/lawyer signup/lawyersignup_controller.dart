// ignore_for_file: camel_case_types

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:law_application/views/client/signup/signup_screen.dart';
import '../../../utils/utils.dart';

import '../../../utils/routes/routesname.dart';
import '../../services/session_manager.dart';

class lawyersignupController with ChangeNotifier {
  signUpScreen usertype = signUpScreen();
  FirebaseAuth auth = FirebaseAuth.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('lawyer');
  bool _loading = false;
  bool get loading => _loading;

  setloaading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void lawyersignUp(BuildContext context, String username, String emailaddress,
      String Password, String role) async {
    setloaading(true);

    try {
      auth
          .createUserWithEmailAndPassword(
              email: emailaddress.trim(), password: Password.trim())
          .then((value) {
        SessionController().userid = value.user!.uid.toString();
        ref.child(value.user!.uid.toString()).set({
          'Uid': value.user!.uid.toString(),
          'email': value.user!.email.toString(),
          'username': username,
          'role': role,
        }).then((value) {
          setloaading(false);

          Navigator.pushNamed(context, RouteName.lawyerExtraInfo);
        }).onError((error, stackTrace) {
          utils.toastmessage(error.toString());
          setloaading(false);
        });

        utils.toastmessage('User created successfully');
        setloaading(false);
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
