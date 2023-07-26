import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:law_application/utils/utils.dart';
import 'package:law_application/views/services/session_manager.dart';

import '../res/colors.dart';

class MessageScreen extends StatefulWidget {
  final String image, email, name, recieverId;
  const MessageScreen(
      {super.key,
      required this.image,
      required this.email,
      required this.name,
      required this.recieverId});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('chat');
  TextEditingController messagecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: FirebaseAnimatedList(
                    query: ref,
                    itemBuilder: (BuildContext context, DataSnapshot snapshot,
                        Animation<double> animation, int index) {
                      String senderid =
                          snapshot.child('sender').value.toString();
                      String recieverid =
                          snapshot.child('reciever').value.toString();
                      if (snapshot.exists) {
                        if ((recieverid == widget.recieverId &&
                                senderid ==
                                    SessionController().userid.toString()) ||
                            recieverid == SessionController().userid) {
                          return MessageBubble(
                              sender: senderid ==
                                      SessionController().userid.toString()
                                  ? 'Me'
                                  : widget.name,
                              text: snapshot.child('message').value.toString(),
                              isMe: senderid ==
                                  SessionController().userid.toString());
                        }
                      }

                      return SizedBox();
                    })),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: TextFormField(
                          controller: messagecontroller,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 19, height: 0),
                          decoration: InputDecoration(
                              suffixIcon: InkWell(
                                onTap: () {
                                  sendmessage();
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(right: 15),
                                  child: CircleAvatar(
                                    child: Icon(Icons.send),
                                  ),
                                ),
                              ),
                              contentPadding: const EdgeInsets.all(15),
                              hintText: 'Enter message',
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                      height: 0,
                                      color: AppColors.primaryTextTextColor
                                          .withOpacity(0.4)),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.textFieldDefaultFocus),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.secondaryColor),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              errorBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.alertColor),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))))),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  sendmessage() {
    if (messagecontroller.text.isEmpty) {
      utils.toastmessage('Enter Message');
    } else {
      final timestamp = DateTime.now().microsecondsSinceEpoch.toString();
      ref.child(timestamp).set({
        'isSeen': false,
        'message': messagecontroller.text.toString(),
        'sender': SessionController().userid.toString(),
        'reciever': widget.recieverId,
        'time': timestamp.toString()
      }).then((value) {
        messagecontroller.clear();
      });
    }
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble({required this.sender, required this.text, required this.isMe});

  final String sender;
  final String text;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            sender,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.black54,
            ),
          ),
          Material(
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0))
                : BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
            elevation: 5.0,
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                text,
                style: TextStyle(
                  color: isMe ? Colors.white : Colors.black54,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
