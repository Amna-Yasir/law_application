import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:law_application/res/colors.dart';
import 'package:law_application/res/components/roundbutton.dart';
import 'package:law_application/utils/utils.dart';
import 'package:law_application/views/services/session_manager.dart';

class helpcenter extends StatefulWidget {
  const helpcenter({super.key});

  @override
  State<helpcenter> createState() => _helpcenterState();
}

class _helpcenterState extends State<helpcenter> {
  FirebaseAuth auth = FirebaseAuth.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('complaints');
  TextEditingController complainController = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: false,
        elevation: 0,
        title: Text(
          "Help Center",
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "How I can assist you?",
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Admin will contact through email within 24 hours of complaint",
                style: TextStyle(
                    color: AppColors.primaryTextTextColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Enter Email',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 5.0,
                          spreadRadius: 1.1)
                    ],
                    borderRadius: BorderRadius.circular(15)),
                child: TextFormField(
                  validator: (value) {
                    return value!.isEmpty ? 'Enter Email' : null;
                  },
                  controller: emailcontroller,
                  maxLines: 1,
                  decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.alertColor),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      border: InputBorder.none,
                      hintText: 'coach@gmail.com'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Help Box',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 5.0,
                          spreadRadius: 1.1)
                    ],
                    borderRadius: BorderRadius.circular(15)),
                child: TextFormField(
                  validator: (value) {
                    return value!.isEmpty ? 'Box empty' : null;
                  },
                  controller: complainController,
                  maxLines: 5,
                  decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.alertColor),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: roundButton(
                      title: 'Submit',
                      onpress: () {
                        final timestamp =
                            DateTime.now().microsecondsSinceEpoch.toString();
                        ref.child(timestamp).set({
                          'Userid': SessionController().userid.toString(),
                          'complaint': complainController.text.toString(),
                          'email': emailcontroller.text.toString(),
                        }).then((value) {
                          complainController.dispose();
                          emailcontroller.dispose();
                          utils.toastmessage('Submit Succesfully');
                        });
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
