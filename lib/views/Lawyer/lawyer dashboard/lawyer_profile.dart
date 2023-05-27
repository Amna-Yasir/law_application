import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:law_application/DialogueBoxes/dialogueboxes.dart';
import 'package:law_application/res/components/roundbutton.dart';
import 'package:law_application/views/Lawyer/lawyer%20dashboard/lawyer_extra_info.dart';
import '../../../../utils/utils.dart';

import '../../../res/colors.dart';
import '../../../res/components/reusablerow.dart';
import '../../services/session_manager.dart';

class lawyerprofile extends StatefulWidget {
  const lawyerprofile({super.key});

  @override
  State<lawyerprofile> createState() => _lawyerprofileState();
}

class _lawyerprofileState extends State<lawyerprofile> {
  final editusernamecontroller = TextEditingController();
  final editemailcontroller = TextEditingController();
  bool loading = true;
  FirebaseAuth auth = FirebaseAuth.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('lawyer');

  @override
  Widget build(BuildContext context) {
    dialogueboxes boxes = dialogueboxes();
    return Scaffold(
      appBar: AppBar(
        title: Text('Lawyer Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              StreamBuilder(
                  stream:
                      ref.child(SessionController().userid.toString()).onValue,
                  builder: (context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasData) {
                      Map<dynamic, dynamic> map = snapshot.data.snapshot.value;
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Column(
                              children: [
                                Container(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            'https://images.pexels.com/photos/3781545/pexels-photo-3781545.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2')),
                                  ),
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: AppColors.primaryColor,
                                          width: 4)),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text('Edit Profile',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              decoration:
                                                  TextDecoration.underline)),
                                )
                              ],
                            ),
                          ),
                          contentRow(
                            titleName: 'Name',
                            content: map['username'],
                          ),
                          contentRow(
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
                    Map<String, dynamic> map = snapshot.data.snapshot.value;
                    if (!snapshot.hasData || map == null) {
                      return roundButton(
                        title: 'Add other fields',
                        onpress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => lawyerExtraInfo()));
                        },
                      );
                    } else if (snapshot.hasData || map != null) {
                      Map<String, dynamic> map = snapshot.data.snapshot.value;
                      return Column(
                        children: [
                          contentRow(
                              content: map['Phone'] == ''
                                  ? 'insert value'
                                  : map['Phone'],
                              titleName: 'Phone Number'),
                          contentRow(
                              content: map['address'] == ''
                                  ? 'insert value'
                                  : map['Phone'],
                              titleName: 'Address'),
                          contentRow(
                              content: map['ZipCode'] == ''
                                  ? 'insert value'
                                  : map['Phone'],
                              titleName: 'Zip Code'),
                          contentRow(
                              content: map['feeperhour'] == ''
                                  ? 'insert value'
                                  : map['Phone'],
                              titleName: 'Hourly Rate'),
                          contentRow(
                              content: map['aboutyourself'] == ''
                                  ? 'insert value'
                                  : map['Phone'],
                              titleName: 'About Yourself'),
                          contentRow(
                              content: map['practicing'] == ''
                                  ? 'insert value'
                                  : map['Phone'],
                              titleName: 'Currently Working')
                        ],
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
  }

//             Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 15),
//                 child: StreamBuilder(
//                     stream: ref
//                         .child(SessionController().userid.toString())
//                         .onValue,
//                     builder: (context, AsyncSnapshot snapshot) {
//                       if (!snapshot.hasData) {
//                         return Center(child: CircularProgressIndicator());
//                       } else if (snapshot.hasData) {
//                         Map<dynamic, dynamic> map =
//                             snapshot.data.snapshot.value;
//                         final username = map['username'];
//                         final email = map['email'];

//                         return Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Center(
//                               child: Column(
//                                 children: [
//                                   Container(
//                                     child: ClipRRect(
//                                       borderRadius: BorderRadius.circular(100),
//                                       child: Image(
//                                           fit: BoxFit.cover,
//                                           image: NetworkImage(
//                                               'https://images.pexels.com/photos/3781545/pexels-photo-3781545.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2')),
//                                     ),
//                                     height: 100,
//                                     width: 100,
//                                     decoration: BoxDecoration(
//                                         shape: BoxShape.circle,
//                                         border: Border.all(
//                                             color: AppColors.secondaryTextColor,
//                                             width: 4)),
//                                   ),
//                                   TextButton(
//                                     onPressed: () {},
//                                     child: Text('Edit Profile',
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .bodyMedium!
//                                             .copyWith(
//                                                 decoration:
//                                                     TextDecoration.underline)),
//                                   )
//                                 ],
//                               ),
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Container(
//                               decoration: BoxDecoration(
//                                   border:
//                                       Border.all(color: AppColors.grayColor),
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(10))),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(11.0),
//                                 child: Column(
//                                   children: [
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Text(
//                                           'Basic Information',
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .headlineMedium,
//                                         ),
//                                         PopupMenuButton(
//                                             itemBuilder: (context) => [
//                                                   PopupMenuItem(
//                                                       child: ListTile(
//                                                     onTap: () {
//                                                       _showupdatedialogue(
//                                                           username, email);
//                                                       Navigator.pop(context);
//                                                     },
//                                                     leading: Icon(Icons.edit),
//                                                     title: Text('Edit'),
//                                                   )),
//                                                 ])
//                                       ],
//                                     ),
//                                     reusableRow(
//                                         leadingicon: Icons.person,
//                                         value: map['username'],
//                                         title: 'Username'),
//                                     reusableRow(
//                                         leadingicon: Icons.email_outlined,
//                                         value: map['email'],
//                                         title: 'Email'),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         );
//                       } else {
//                         return Text('Something Went Wrong');
//                       }
//                     })),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               child: Container(
//                 decoration: BoxDecoration(
//                     border: Border.all(color: AppColors.grayColor),
//                     borderRadius: BorderRadius.all(Radius.circular(10))),
//                 child: Padding(
//                   padding: const EdgeInsets.all(11.0),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             'Other Credentials',
//                             style: Theme.of(context).textTheme.headlineMedium,
//                           ),
//                           PopupMenuButton(
//                               itemBuilder: (context) => [
//                                     PopupMenuItem(
//                                         child: ListTile(
//                                       onTap: () {},
//                                       leading: Icon(Icons.edit),
//                                       title: Text('Edit'),
//                                     )),
//                                   ])
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ));
//   }

//   Future<void> _showupdatedialogue(String username, String email) async {
//     editusernamecontroller.text = username;
//     editemailcontroller.text = email;
//     return await showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text('Edit Informatiom'),
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextFormField(
//                   controller: editusernamecontroller,
//                   decoration: const InputDecoration(
//                     hintText: 'Edit username',
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 TextFormField(
//                   controller: editemailcontroller,
//                   decoration: const InputDecoration(
//                     hintText: 'Edit email',
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//               ],
//             ),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   ref.child(SessionController().userid.toString()).update({
//                     'username': editusernamecontroller.text.toLowerCase(),
//                     'email': editemailcontroller.text.toLowerCase()
//                   }).then((value) {
//                     utils.toastmessage('Information Update');
//                   }).onError((error, stackTrace) {
//                     utils.toastmessage(e.toString());
//                   }).then((value) {
//                     Navigator.pop(context);
//                   });
//                 },
//                 child: Text(
//                   'Edit',
//                   style: Theme.of(context).textTheme.bodyLarge,
//                 ),
//               ),
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: Text(
//                   'Cancel',
//                   style: Theme.of(context).textTheme.bodyLarge,
//                 ),
//               )
//             ],
//           );
//         });
//   }
// }
}

class contentRow extends StatelessWidget {
  contentRow({
    required this.content,
    required this.titleName,
    super.key,
  });
  String content;
  String titleName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
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
            width: 400,
            height: 50,
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
