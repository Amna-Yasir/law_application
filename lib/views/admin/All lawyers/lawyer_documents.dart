import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:law_application/views/client/homescreen/uploadcnicController.dart';
import 'package:provider/provider.dart';

import '../../../../res/colors.dart';

class lawyer_documents extends StatefulWidget {
  const lawyer_documents(
      {super.key, required this.userid, required this.lawyername});
  final String userid;
  final String lawyername;
  @override
  State<lawyer_documents> createState() => _lawyer_documentsState();
}

DatabaseReference lawyerref = FirebaseDatabase.instance.ref().child('lawyer');

class _lawyer_documentsState extends State<lawyer_documents> {
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
                      stream: lawyerref.child(widget.userid).onValue,
                      builder: (context, AsyncSnapshot snapshot) {
                        Map<dynamic, dynamic> map =
                            snapshot.data.snapshot.value;
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.lawyername + '\'s Documents',
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'It is mandotory for lawyer to  upload documents  otherwise  account is blocked in 15 days.',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 300,
                                    width: 300,
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
                                        child: map['cnic'].toString() == ""
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
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 300,
                                    width: 300,
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
                                        child: map['license'].toString() == ""
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
