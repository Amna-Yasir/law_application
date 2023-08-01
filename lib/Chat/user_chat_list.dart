import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:law_application/Chat/message_screen.dart';
import 'package:law_application/res/colors.dart';
import 'package:law_application/views/services/session_manager.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class chatlist extends StatefulWidget {
  const chatlist({super.key});

  @override
  State<chatlist> createState() => _chatlistState();
}

final serachfilter = TextEditingController();

class _chatlistState extends State<chatlist> {
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('lawyer');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: false,
        elevation: 0,
        title: Text(
          "Conversations",
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(top: 16, left: 16, right: 16),
        child: Column(children: [
          TextField(
            controller: serachfilter,
            onChanged: (value) {
              setState(() {});
            },
            decoration: InputDecoration(
              hintText: "Search by name",
              hintStyle: TextStyle(color: Colors.grey.shade600),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey.shade600,
                size: 20,
              ),
              filled: true,
              fillColor: Colors.grey.shade100,
              contentPadding: EdgeInsets.all(8),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.grey.shade100)),
            ),
          ),
          Expanded(
            child: FirebaseAnimatedList(
              query: ref,
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                final name = Text(
                  snapshot.child('username').value.toString(),
                );
                if (serachfilter.text.isEmpty) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      borderOnForeground: true,
                      shadowColor: AppColors.dividedColor,
                      child: ListTile(
                        onTap: () {
                          PersistentNavBarNavigator.pushNewScreen(context,
                              screen: MessageScreen(
                                email: snapshot.child('email').value.toString(),
                                image:
                                    snapshot.child('profile').value.toString(),
                                name:
                                    snapshot.child('username').value.toString(),
                                recieverId:
                                    snapshot.child('Uid').value.toString(),
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
                            child:
                                snapshot.child('profile').value.toString() == ""
                                    ? Icon(Icons.person)
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Image(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(snapshot
                                                .child('profile')
                                                .value
                                                .toString())),
                                      )),
                        title:
                            Text(snapshot.child('username').value.toString()),
                        subtitle:
                            Text(snapshot.child('email').value.toString()),
                      ),
                    ),
                  );
                } else if (name
                    .toString()
                    .toLowerCase()
                    .contains(serachfilter.text.toLowerCase())) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      borderOnForeground: true,
                      shadowColor: AppColors.dividedColor,
                      child: ListTile(
                        onTap: () {
                          PersistentNavBarNavigator.pushNewScreen(context,
                              screen: MessageScreen(
                                email: snapshot.child('email').value.toString(),
                                image:
                                    snapshot.child('profile').value.toString(),
                                name:
                                    snapshot.child('username').value.toString(),
                                recieverId:
                                    snapshot.child('Uid').value.toString(),
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
                            child:
                                snapshot.child('profile').value.toString() == ""
                                    ? Icon(Icons.person)
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Image(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(snapshot
                                                .child('profile')
                                                .value
                                                .toString())),
                                      )),
                        title:
                            Text(snapshot.child('username').value.toString()),
                        subtitle:
                            Text(snapshot.child('email').value.toString()),
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ]),
      )),
    );
  }
}
