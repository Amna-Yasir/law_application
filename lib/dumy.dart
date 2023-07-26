// // //  Function for user login
// //   void login(BuildContext context) async {
// //     setLoading(true);
// //     try {
// //       //logging user

// //       final value = await auth.signInWithEmailAndPassword(
// //           email: emailController.text.trim(),
// //           password: passwordController.text.trim());

// //       CollectionReference ref = FirebaseFirestore.instance.collection('User');
// //       ref.doc(value.user!.uid.toString()).get().then((value) async {
// //         setLoading(false);
// //         await SessionController.saveUserInPreference(
// //             value.data(), value['role']);
// //         await SessionController.getUserFromPreference();
// //         emailController.clear();
// //         passwordController.clear();
// //         // Navigator.pushNamed(context, RouteName.playerDashboardScreen);
// //         if (value['role'] == 'coach') {
// //           Navigator.pushNamed(context, RouteName.couchDashboardScreen);
// //         } else if (value['role'] == 'superAdmin') {
// //           Navigator.pushNamed(context, RouteName.superAdminDashboardScreen);
// //         } else if (value['role'] == 'staff') {
// //           Navigator.pushNamed(context, RouteName.staffDashboardScreen);
// //         } else {
// //           Navigator.pushNamed(context, RouteName.playerDashboardScreen);
// //         }
// //       });

// //       // if (!value.user!.emailVerified) {
// //       //   setLoading(false);
// //       //   userEmailIsNotVerified(context, value);
// //       // } else {
// //       //   //getting user details
// //       //
// //       // }
// //     } on FirebaseAuthException catch (e) {
// //       setLoading(false);
// //       if (e.code == 'email-already-in-use') {
// //         Utils.flushBarErrorMessage(e.message.toString(), context);
// //       } else if (e.code == 'missing-email') {
// //         Utils.flushBarErrorMessage('Email address not found', context);
// //       } else if (e.code == 'wrong-password') {
// //         Utils.flushBarErrorMessage(e.message.toString(), context);
// //       } else if (e.code == 'user-not-found') {
// //         Utils.flushBarErrorMessage(e.message.toString(), context);
// //       } else {
// //         Utils.flushBarErrorMessage(e.message.toString(), context);
// //       }
// //     } catch (e) {
// //       setLoading(false);
// //       Utils.toastMessage(e.toString());
// //     }
// //   }



// import 'package:dastarkhwanapp/model/user.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class ChatScreen extends StatefulWidget {
//   final ChatUser currentUser;
//   final ChatUser recipientUser;
//   // ignore: prefer_const_constructors_in_immutables
//   ChatScreen({Key? key, required this.currentUser, required this.recipientUser}) : super(key: key);
//   @override
//   State<ChatScreen> createState() => __ChatScreenState();
// }

// class __ChatScreenState extends State<ChatScreen> {
// final TextEditingController _messageController = TextEditingController();
// void _sendMessage(String message) {
//     // Save the message to the database
//     FirebaseFirestore.instance
//         .collection('messages')
//         .add({
//           'senderId': widget.currentUser.id,
//           'recipientId':widget.recipientUser.id,
//           'message': message,
//           'timestamp': DateTime.now(),
//         })
//         .then((value) => _messageController.clear())
//         .catchError((error) => print("Failed to send message: $error"));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Chat with ${widget.recipientUser.name}'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: StreamBuilder<QuerySnapshot>(
//               stream: FirebaseFirestore.instance
//                   .collection('messages')
//                   .where('senderId', isEqualTo: widget.currentUser.id)
//                   .where('recipientId', isEqualTo: widget.recipientUser.id)
//                   .orderBy('timestamp', descending: true)
//                   .snapshots(),
//               builder: (context, snapshot) {
//                 if (snapshot.hasError) {
//                   return Text('Error: ${snapshot.error}');
//                 }

//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return CircularProgressIndicator();
//                 }

//                 final messages = snapshot.data!.docs;

//                 return ListView.builder(
//                   reverse: true,
//                   itemCount: messages.length,
//                   itemBuilder: (context, index) {
//                     final message = messages[index].data() as Map<String,dynamic>?;
//                     final String senderId= message?['senderId'] ;

//                     return ListTile(
//                       title: Text(message?['message']),
//                       subtitle: Text(senderId == widget.currentUser.id ? 'You' : widget.recipientUser.name),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 8.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _messageController,
//                     decoration: InputDecoration(hintText: 'Type a message...'),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.send),
//                   onPressed: () => _sendMessage(_messageController.text),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }