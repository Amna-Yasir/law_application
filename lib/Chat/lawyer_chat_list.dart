import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:law_application/Chat/lawyer_message_screen.dart';
import 'package:law_application/res/colors.dart';
import 'package:law_application/views/services/session_manager.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class lawyer_chat_list extends StatefulWidget {
  const lawyer_chat_list({super.key});

  @override
  State<lawyer_chat_list> createState() => _lawyer_chat_listState();
}

class _lawyer_chat_listState extends State<lawyer_chat_list> {
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('User');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Lawyers'),
      ),
      body: SafeArea(
          child: FirebaseAnimatedList(
        query: ref,
        itemBuilder: (BuildContext context, DataSnapshot snapshot,
            Animation<double> animation, int index) {
          if (SessionController().userid.toString() ==
              snapshot.value.toString()) {
            return Container();
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                borderOnForeground: true,
                shadowColor: AppColors.dividedColor,
                child: ListTile(
                  onTap: () {
                    PersistentNavBarNavigator.pushNewScreen(context,
                        screen: lawyerMessageScreen(
                          email: snapshot.child('email').value.toString(),
                          image: snapshot.child('profile').value.toString(),
                          name: snapshot.child('username').value.toString(),
                          recieverId: snapshot.child('Uid').value.toString(),
                        ),
                        withNavBar: false);
                  },
                  leading: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.primarybuttonColor,
                          )),
                      child: snapshot.child('profile').value.toString() == " "
                          ? Icon(Icons.percent_outlined)
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(snapshot
                                      .child('profile')
                                      .value
                                      .toString())),
                            )),
                  title: Text(snapshot.child('username').value.toString()),
                  subtitle: Text(snapshot.child('email').value.toString()),
                ),
              ),
            );
          }
        },
      )),
    );
  }
}
