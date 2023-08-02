import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:law_application/views/admin/All%20lawyers/lawyer_record.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../res/colors.dart';
import '../../services/session_manager.dart';

// ignore: camel_case_types
class All_lawyer extends StatefulWidget {
  const All_lawyer({super.key});

  @override
  State<All_lawyer> createState() => _All_lawyerState();
}

class _All_lawyerState extends State<All_lawyer> {
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('lawyer');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Registerd lawyers'),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
        child: Column(
          children: [
            Center(
                child: Text(
              'As an admin, you have the authority to view and manage all the registered lawyers in the system.',
              style: Theme.of(context).textTheme.bodyLarge,
            )),
            Expanded(
              child: FirebaseAnimatedList(
                query: ref,
                itemBuilder: (BuildContext context, snapshot,
                    Animation<double> animation, int index) {
                  if (SessionController().userid.toString() ==
                      snapshot.value.toString()) {
                    return Container();
                  } else {
                    return listContainer(
                      withArrow: true,
                      child: ListTile(
                        trailing: PopupMenuButton(
                            itemBuilder: (context) => [
                                  PopupMenuItem(
                                      value: 1,
                                      child: ListTile(
                                        onTap: () {
                                          Navigator.pop(context);
                                          ref
                                              .child(
                                                snapshot
                                                    .child('Uid')
                                                    .value
                                                    .toString(),
                                              )
                                              .remove();
                                        },
                                        leading:
                                            Icon(Icons.delete_outline_rounded),
                                        title: Text('Delete'),
                                      ))
                                ]),
                        onTap: () {
                          PersistentNavBarNavigator.pushNewScreen(context,
                              screen: lawyerRecord(
                                username:
                                    snapshot.child('username').value.toString(),
                                email: snapshot.child('email').value.toString(),
                                phone: snapshot
                                    .child('extrainfo')
                                    .child('Phone')
                                    .value
                                    .toString(),
                                address: snapshot
                                    .child('extrainfo')
                                    .child('address')
                                    .value
                                    .toString(),
                                description: snapshot
                                    .child('extrainfo')
                                    .child('aboutyourself')
                                    .child('username')
                                    .value
                                    .toString(),
                                category: snapshot
                                    .child('extrainfo')
                                    .child('category')
                                    .value
                                    .toString(),
                                Userid: snapshot.child('Uid').value.toString(),
                                profilepicture:
                                    snapshot.child('profile').value.toString(),
                              ));
                        },
                        leading: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.primarybuttonColor,
                                )),
                            child:
                                snapshot.child('profile').value.toString() == ""
                                    ? Icon(Icons.person)
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(60),
                                        child: Image(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(snapshot
                                                .child('profile')
                                                .value
                                                .toString())),
                                      )),
                        title: Text(
                          snapshot.child('username').value.toString(),
                          style: TextStyle(fontSize: 20),
                        ),
                        subtitle: Text(
                          snapshot.child('email').value.toString(),
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class listContainer extends StatelessWidget {
  final bool withArrow;
  final Widget child;
  final Function()? onTap;

  listContainer(
      {Key? key, required this.withArrow, required this.child, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(40),
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(child: child),
                  if (withArrow)
                    Icon(Icons.arrow_forward_ios,
                        color: AppColors.primaryTextTextColor, size: 20)
                ],
              ),
            ),
          ),
        ),
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.12),
                blurRadius: 5.0,
                spreadRadius: 1.1)
          ],
        ),
      ),
    );
  }
}
