import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:law_application/res/components/textfield%20and%20row/input_text_field.dart';
import 'package:law_application/res/components/roundbutton.dart';
import 'package:law_application/utils/utils.dart';
import 'package:law_application/views/client/login/Auth/verifycode.dart';

class LoginwithPhonenumber extends StatefulWidget {
  const LoginwithPhonenumber({super.key});

  @override
  State<LoginwithPhonenumber> createState() => _LoginwithPhonenumberState();
}

class _LoginwithPhonenumberState extends State<LoginwithPhonenumber> {
  bool loading = false;
  final auth = FirebaseAuth.instance;
  final phonenumbercontroller = TextEditingController();
  final phonenumberFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Inputextfield(
                  mycontoller: phonenumbercontroller,
                  focusnode: phonenumberFocus,
                  onFilledSubmittedvalue: (value) {},
                  onValidator: (value) {
                    value.isEmpty ? 'Enter Phone' : null;
                    return null;
                  },
                  keyboardtype: TextInputType.phone,
                  hint: '+9203684508',
                  obsecuretext: false),
              roundButton(
                  loading: loading,
                  title: 'Verify ',
                  onpress: () {
                    setState(() {
                      loading = true;
                    });
                    auth.verifyPhoneNumber(
                        phoneNumber: phonenumbercontroller.text,
                        verificationCompleted: (_) {},
                        verificationFailed: (e) {
                          utils.toastmessage(e.toString());
                        },
                        codeSent: (verificationId, forceResendingToken) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    verifycode(verificaionid: verificationId)),
                          );
                          setState(() {
                            loading = false;
                          });
                        },
                        codeAutoRetrievalTimeout: (e) {
                          utils.toastmessage(e.toString());
                          setState(() {
                            loading = false;
                          });
                        });
                  })
            ]),
      ),
    );
  }
}
