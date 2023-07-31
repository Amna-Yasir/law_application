import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../res/colors.dart';
import '../../../services/session_manager.dart';
import '../lawyer profile section/lawyer_other_information_controller.dart';

class LicenseandCnic extends StatefulWidget {
  const LicenseandCnic({super.key});

  @override
  State<LicenseandCnic> createState() => _LicenseandCnicState();
}

DatabaseReference lawyerref = FirebaseDatabase.instance.ref().child('lawyer');

class _LicenseandCnicState extends State<LicenseandCnic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('License and CNIC'),
        ),
        body: ChangeNotifierProvider(
            create: (_) => licenseController(),
            child: Consumer<licenseController>(
                builder: (context, provider, child) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: StreamBuilder(
                      stream: lawyerref
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
                              'Your Documents',
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'You can change your uploaded License and CNIC by clicking on edit button',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 150,
                                    width: 150,
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
                                        'Edit License',
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
                                    height: 150,
                                    width: 150,
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
                                        'Edit CNIC',
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
                          ],
                        );
                      }),
                ),
              );
            })));
  }
}
