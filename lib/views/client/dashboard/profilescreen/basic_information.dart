import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:law_application/res/components/roundbutton.dart';
import 'package:law_application/utils/routes/routesname.dart';
import 'package:law_application/utils/utils.dart';
import 'package:law_application/views/services/session_manager.dart';

class clientBasicInfo extends StatefulWidget {
  const clientBasicInfo({super.key});

  @override
  State<clientBasicInfo> createState() => _clientBasicInfo();
}

class _clientBasicInfo extends State<clientBasicInfo> {
  TextEditingController address = TextEditingController();
  TextEditingController phonenumber = TextEditingController();

  DatabaseReference ref = FirebaseDatabase.instance.ref().child('User');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Law Firm'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Personal Information',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Please fill out the following section it is manadatory',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                child: TextFormField(
                  controller: address,
                  maxLines: 1,
                  decoration: InputDecoration(
                      hintText: 'Address',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: phonenumber,
                  maxLines: 1,
                  decoration: InputDecoration(
                      hintText: 'Phone Number',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              roundButton(
                  title: 'Save',
                  onpress: () {
                    ref.child(SessionController().userid.toString()).update({
                      'Phone': phonenumber.text,
                      'address': address.text,
                    }).then((value) {
                      Navigator.pop(context);
                      utils.toastmessage('Save Successfully');

                      Navigator.pushNamed(context, RouteName.clientloginView);
                    }).onError((error, stackTrace) {
                      error.toString();
                    }).then((value) {});
                  })
            ],
          ),
        ),
      ),
    );
  }
}
