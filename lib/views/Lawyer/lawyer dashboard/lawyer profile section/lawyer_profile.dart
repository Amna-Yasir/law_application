import 'dart:io';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:law_application/utils/routes/routesname.dart';
import 'package:law_application/views/Lawyer/lawyer%20dashboard/lawyer%20profile%20section/lawyer_profile_controller.dart';
import 'package:provider/provider.dart';

import '../../../../../utils/utils.dart';
import '../../../../res/colors.dart';
import '../../../services/session_manager.dart';

class lawyerprofile extends StatefulWidget {
  const lawyerprofile({super.key});

  @override
  State<lawyerprofile> createState() => _lawyerprofileState();
}

class _lawyerprofileState extends State<lawyerprofile> {
  final editcategory = TextEditingController();

  final editphonenumber = TextEditingController();

  final editzipcode = TextEditingController();

  final editfeeperhour = TextEditingController();

  final editcurrentPracticing = TextEditingController();

  final editaddress = TextEditingController();

  final editaboutyourself = TextEditingController();
  bool loading = true;
  FirebaseAuth auth = FirebaseAuth.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('lawyer');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Profile'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  FirebaseAuth auth = FirebaseAuth.instance;
                  auth.signOut().then((value) {
                    SessionController().userid = '';
                    Navigator.pushNamed(context, RouteName.usermanagerView);
                  });
                },
                icon: Icon(Icons.logout_outlined))
          ],
        ),
        body: ChangeNotifierProvider(
          create: (_) => ProfileController(),
          child:
              Consumer<ProfileController>(builder: (context, provider, child) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
              child: SingleChildScrollView(
                child: Expanded(
                  child: Column(
                    children: [
                      StreamBuilder(
                          stream: ref
                              .child(SessionController().userid.toString())
                              .onValue,
                          builder: (context, AsyncSnapshot snapshot) {
                            if (!snapshot.hasData) {
                              return Center(child: CircularProgressIndicator());
                            } else if (snapshot.hasData) {
                              Map<dynamic, dynamic> map =
                                  snapshot.data.snapshot.value;

                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10.0),
                                          child: Center(
                                            child: Container(
                                                height: 130,
                                                width: 130,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        color: AppColors
                                                            .primaryColor,
                                                        width: 2)),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                  child: provider.image == null
                                                      ? map['profile']
                                                                  .toString() ==
                                                              ''
                                                          ? const Icon(
                                                              Icons.person)
                                                          : Image(
                                                              fit: BoxFit.cover,
                                                              image: NetworkImage(
                                                                  map['profile']
                                                                      .toString()),
                                                              loadingBuilder:
                                                                  (context,
                                                                      child,
                                                                      loadingProgress) {
                                                                if (loadingProgress ==
                                                                    null)
                                                                  return child;
                                                                return Center(
                                                                    child:
                                                                        CircularProgressIndicator());
                                                              },
                                                            )
                                                      : Image.file(
                                                          File(provider
                                                                  .image!.path)
                                                              .absolute,
                                                          fit: BoxFit.cover,
                                                        ),
                                                )),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            provider.pickimage(context);
                                          },
                                          child: CircleAvatar(
                                            radius: 14,
                                            backgroundColor:
                                                AppColors.primaryColor,
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                              size: 18,
                                            ),
                                          ),
                                        )
                                      ]),
                                  ContentRow(
                                    titleName: 'Name',
                                    content: map['username'],
                                  ),
                                  ContentRow(
                                    titleName: 'Email',
                                    content: map['email'],
                                  ),
                                ],
                              );
                            } else {
                              return Text('Something Went Wrong');
                            }
                          }),
                      StreamBuilder(
                          stream: ref
                              .child(SessionController().userid.toString())
                              .child('extrainfo')
                              .onValue,
                          builder: (context, AsyncSnapshot snapshot) {
                            if (!snapshot.hasData) {
                              return CircularProgressIndicator();
                            } else if (snapshot.hasData) {
                              Map<dynamic, dynamic> map =
                                  snapshot.data.snapshot.value;
                              final phone = map['Phone'];
                              final category = map['category'];
                              final address = map['address'];
                              final zipCode = map['ZipCode'];
                              final hourlyrate = map['feeperhour'];
                              final aboutyourself = map['aboutyourself'];
                              final currentlyworking = map['practicing'];
                              return Container(
                                child: Column(
                                  children: [
                                    ContentRow(
                                        content: map['Phone'],
                                        titleName: 'Phone Number'),
                                    ContentRow(
                                        content: map['address'],
                                        titleName: 'Address'),
                                    ContentRow(
                                        content: map['ZipCode'],
                                        titleName: 'Zip Code'),
                                    ContentRow(
                                        content: map['category'],
                                        titleName: 'Category'),
                                    ContentRow(
                                        content: map['feeperhour'],
                                        titleName: 'Hourly Rate'),
                                    ContentRow(
                                        content: map['aboutyourself'],
                                        titleName: 'About Yourself'),
                                    ContentRow(
                                        content: map['practicing'],
                                        titleName: 'Currently Working'),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: TextButton(
                                        child: Text(
                                          'Edit',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                                  color:
                                                      AppColors.primaryColor),
                                        ),
                                        onPressed: () {
                                          _showinfoupdatedialogue(
                                            phone,
                                            address,
                                            zipCode,
                                            category,
                                            hourlyrate,
                                            aboutyourself,
                                            currentlyworking,
                                          );
                                          // edit.showupdatedialogue(
                                          //     phone,
                                          //     address,
                                          //     zipCode,
                                          //     hourlyrate,
                                          //     aboutyourself,
                                          //     currentlyworking);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              return Text('Something Went Wrong');
                            }
                          })
                    ],
                  ),
                ),
              ),
            );
          }),
        ));
  }

  Future<void> _showinfoupdatedialogue(String phone, address, zipCode, category,
      hourlyrate, aboutyourself, currentlyworking) async {
    editcategory.text = category;
    editphonenumber.text = phone;
    editaboutyourself.text = aboutyourself;
    editzipcode.text = zipCode;
    editaddress.text = address;
    editcurrentPracticing.text = currentlyworking;
    editfeeperhour.text = hourlyrate;
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            insetPadding: EdgeInsets.all(20),
            scrollable: true,
            title: Text('Edit Informatiom'),
            content: SingleChildScrollView(
              child: Container(
                width: 300,
                child: Column(
                  children: [
                    TextFormField(
                      controller: editcategory,
                      maxLines: 1,
                      decoration: InputDecoration(
                          hintText: 'Category',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: editphonenumber,
                      maxLines: 1,
                      decoration: InputDecoration(
                          hintText: 'Phone Number',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: editzipcode,
                      maxLines: 1,
                      decoration: InputDecoration(
                          hintText: 'Zip Code',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: editfeeperhour,
                      maxLines: 1,
                      decoration: InputDecoration(
                          hintText: 'Fee Per Hour',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: editcurrentPracticing,
                      maxLines: 1,
                      decoration: InputDecoration(
                          hintText: 'Current Practicing At?',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: editaddress,
                      maxLines: 2,
                      decoration: InputDecoration(
                          hintText: 'Address',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: editaboutyourself,
                      maxLines: 4,
                      decoration: InputDecoration(
                          hintText: 'About Yourself',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  ref
                      .child(SessionController().userid.toString())
                      .child('extrainfo')
                      .update({
                    'category': editcategory.text.toLowerCase(),
                    'Phone': editphonenumber.text.toLowerCase(),
                    'ZipCode': editzipcode.text.toLowerCase(),
                    'feeperhour': editfeeperhour.text.toLowerCase(),
                    'practicing': editcurrentPracticing.text.toLowerCase(),
                    'address': editaddress.text.toLowerCase(),
                    'aboutyourself': editaboutyourself.text.toLowerCase()
                  }).then((value) {
                    utils.toastmessage('Information Update');
                  }).onError((error, stackTrace) {
                    utils.toastmessage(e.toString());
                  }).then((value) {
                    Navigator.pop(context);
                  });
                },
                child: Text(
                  'Edit',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Cancel',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              )
            ],
          );
        });
  }
}

class ContentRow extends StatelessWidget {
  ContentRow({
    required this.content,
    required this.titleName,
    super.key,
  });
  final String content;
  final String titleName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            titleName,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 232, 230, 230),
                borderRadius: BorderRadius.circular(30)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child:
                  Text(content, style: Theme.of(context).textTheme.bodyLarge!),
            ),
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
