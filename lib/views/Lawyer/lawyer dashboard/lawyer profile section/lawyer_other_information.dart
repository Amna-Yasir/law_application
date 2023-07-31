import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:law_application/res/components/roundbutton.dart';
import 'package:law_application/utils/routes/routesname.dart';
import 'package:law_application/utils/utils.dart';
import 'package:law_application/views/Lawyer/lawyer%20dashboard/lawyer%20profile%20section/lawyer_other_information_controller.dart';
import 'package:law_application/views/services/session_manager.dart';
import 'package:provider/provider.dart';

import '../../../../res/colors.dart';

class lawyerOtherInfo extends StatefulWidget {
  const lawyerOtherInfo({super.key});

  @override
  State<lawyerOtherInfo> createState() => _lawyerOtherInfoState();
}

class _lawyerOtherInfoState extends State<lawyerOtherInfo> {
  TextEditingController category = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  TextEditingController zipcode = TextEditingController();
  TextEditingController feeperhour = TextEditingController();
  TextEditingController currentPracticing = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController aboutyourself = TextEditingController();
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('lawyer');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Law Firm'),
          automaticallyImplyLeading: false,
        ),
        body: ChangeNotifierProvider(
            create: (_) => licenseController(),
            child: Consumer<licenseController>(
                builder: (context, provider, child) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: StreamBuilder(
                      stream: ref
                          .child(SessionController().userid.toString())
                          .onValue,
                      builder: (context, AsyncSnapshot snapshot) {
                        Map<dynamic, dynamic> map =
                            snapshot.data.snapshot.value;
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Personal Information',
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Please fill out the following section it is manadatory. So your client can check all of your details',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                            color:
                                                AppColors.primaryTextTextColor,
                                            width: 2)),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                          Radius.zero,
                                        ),
                                        child: map['license'].toString() == ''
                                            ? const Icon(Icons.person)
                                            : Image(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    map['license'].toString()),
                                                loadingBuilder: (context, child,
                                                    loadingProgress) {
                                                  if (loadingProgress == null)
                                                    return child;
                                                  return Center(
                                                      child:
                                                          CircularProgressIndicator());
                                                },
                                              )),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        provider.picklicens(context);
                                      },
                                      child: Text(
                                        'Upload License',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                                fontSize: 15,
                                                decoration:
                                                    TextDecoration.underline),
                                      ))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                            color:
                                                AppColors.primaryTextTextColor,
                                            width: 2)),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                          Radius.zero,
                                        ),
                                        child: map['cnic'].toString() == ''
                                            ? const Icon(Icons.person)
                                            : Image(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    map['cnic'].toString()),
                                                loadingBuilder: (context, child,
                                                    loadingProgress) {
                                                  if (loadingProgress == null)
                                                    return child;
                                                  return Center(
                                                      child:
                                                          CircularProgressIndicator());
                                                },
                                              )),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        provider.pickcnic(context);
                                      },
                                      child: Text(
                                        'Upload CNIC',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                                fontSize: 15,
                                                decoration:
                                                    TextDecoration.underline),
                                      ))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 8),
                              child: TextFormField(
                                controller: category,
                                maxLines: 1,
                                decoration: InputDecoration(
                                    hintText: 'Category',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
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
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: zipcode,
                                maxLines: 1,
                                decoration: InputDecoration(
                                    hintText: 'Zip Code',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: feeperhour,
                                maxLines: 1,
                                decoration: InputDecoration(
                                    hintText: 'Fee Per Hour',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: currentPracticing,
                                maxLines: 1,
                                decoration: InputDecoration(
                                    hintText: 'Current Practicing At?',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: address,
                                maxLines: 2,
                                decoration: InputDecoration(
                                    hintText: 'Address',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: aboutyourself,
                                maxLines: 4,
                                decoration: InputDecoration(
                                    hintText: 'About Yourself',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              ),
                            ),
                            roundButton(
                                title: 'Save',
                                onpress: () {
                                  ref
                                      .child(
                                          SessionController().userid.toString())
                                      .child('extrainfo')
                                      .set({
                                    'category': category.text,
                                    'Phone': phonenumber.text,
                                    'ZipCode': zipcode.text,
                                    'feeperhour': feeperhour.text,
                                    'practicing': currentPracticing.text,
                                    'address': address.text,
                                    'aboutyourself': aboutyourself.text
                                  }).then((value) {
                                    Navigator.pop(context);
                                    utils.toastmessage('Save Successfully');

                                    Navigator.pushNamed(
                                        context, RouteName.lawyerloginView);
                                  }).onError((error, stackTrace) {
                                    error.toString();
                                  }).then((value) {});
                                })
                          ],
                        );
                      }),
                ),
              );
            })));
  }
}
