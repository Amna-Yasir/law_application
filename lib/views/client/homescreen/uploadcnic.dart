import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:law_application/views/client/homescreen/uploadcnicController.dart';
import 'package:law_application/views/services/session_manager.dart';
import 'package:provider/provider.dart';

import '../../../../res/colors.dart';

class Client_Cnic extends StatefulWidget {
  const Client_Cnic({super.key});

  @override
  State<Client_Cnic> createState() => _Client_CnicState();
}

DatabaseReference lawyerref = FirebaseDatabase.instance.ref().child('User');

class _Client_CnicState extends State<Client_Cnic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Upload CNIC'),
        ),
        body: ChangeNotifierProvider(
            create: (_) => Clieny_Cnic_Controller(),
            child: Consumer<Clieny_Cnic_Controller>(
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
                                'It is mandotory to upload your CNIC otherwise your account is blocked in 15 days.You have to uploaded  CNIC by clicking on add button.',
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
                                        child: map['cnic'].toString() == ''
                                            ? const Icon(Icons.person)
                                            : Image(
                                                fit: BoxFit.contain,
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
                                        'Add CNIC',
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
