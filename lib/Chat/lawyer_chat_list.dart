import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:law_application/Chat/message_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class lawyer_chat_list extends StatefulWidget {
  const lawyer_chat_list({super.key});

  @override
  State<lawyer_chat_list> createState() => _lawyer_chat_listState();
}

final serachfilter = TextEditingController();

class _lawyer_chat_listState extends State<lawyer_chat_list> {
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('User');

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
        child: Column(
          children: [
            TextField(
              controller: serachfilter,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                hintText: "Search...",
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
            SizedBox(
              height: 10,
            ),
            Divider(),
            Expanded(
              child: FirebaseAnimatedList(
                query: ref,
                itemBuilder: (BuildContext context, DataSnapshot snapshot,
                    Animation<double> animation, int index) {
                  final name =
                      Text(snapshot.child('username').value.toString());
                  if (serachfilter.text.isEmpty) {
                    return Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: ListTile(
                            onTap: () {
                              PersistentNavBarNavigator.pushNewScreen(context,
                                  screen: MessageScreen(
                                    email: snapshot
                                        .child('email')
                                        .value
                                        .toString(),
                                    image: snapshot
                                        .child('Profilepicture')
                                        .value
                                        .toString(),
                                    name: snapshot
                                        .child('username')
                                        .value
                                        .toString(),
                                    recieverId:
                                        snapshot.child('Uid').value.toString(),
                                  ),
                                  withNavBar: false);
                            },
                            leading: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: snapshot
                                            .child('Profilepicture')
                                            .value
                                            .toString() ==
                                        " "
                                    ? Icon(Icons.percent_outlined)
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Image(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(snapshot
                                                .child('Profilepicture')
                                                .value
                                                .toString())),
                                      )),
                            title: Text(
                              snapshot.child('username').value.toString(),
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            subtitle:
                                Text(snapshot.child('email').value.toString()),
                          ),
                        ),
                        Divider()
                      ],
                    );
                  } else if (name
                      .toString()
                      .toLowerCase()
                      .contains(serachfilter.text.toLowerCase())) {
                    return Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: ListTile(
                            onTap: () {
                              PersistentNavBarNavigator.pushNewScreen(context,
                                  screen: MessageScreen(
                                    email: snapshot
                                        .child('email')
                                        .value
                                        .toString(),
                                    image: snapshot
                                        .child('profile')
                                        .value
                                        .toString(),
                                    name: snapshot
                                        .child('username')
                                        .value
                                        .toString(),
                                    recieverId:
                                        snapshot.child('Uid').value.toString(),
                                  ),
                                  withNavBar: false);
                            },
                            leading: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: snapshot
                                            .child('profile')
                                            .value
                                            .toString() ==
                                        " "
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
                            title: Text(
                              snapshot.child('username').value.toString(),
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            subtitle:
                                Text(snapshot.child('email').value.toString()),
                          ),
                        ),
                        Divider()
                      ],
                    );
                  } else {
                    return Container();
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
