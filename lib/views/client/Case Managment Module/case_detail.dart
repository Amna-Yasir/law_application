import 'package:flutter/material.dart';

import '../../../../res/colors.dart';

class C_CourtCasePage extends StatelessWidget {
  const C_CourtCasePage({
    super.key,
    required this.casenumber,
    required this.Casetitle,
    required this.Court,
    required this.Startingdate,
    required this.opname,
    required this.clientname,
    required this.hearingstatus,
    required this.judgeremarks,
  });
  final String casenumber;
  final String Casetitle;
  final String Court;
  final String Startingdate;
  final String opname;
  final String clientname;
  final String hearingstatus;
  final String judgeremarks;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Court Case Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: AppColors.primaryColor.withOpacity(0.2),
                      blurRadius: 2,
                      spreadRadius: 4,
                      offset: Offset(0, 4))
                ]),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Case Number:' + casenumber,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Case Title:' + Casetitle,
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Court : ' + Court,
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Starting Date:' + Startingdate,
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Parties Involved:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text(opname),
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text(clientname),
                  ),
                  SizedBox(height: 24),
                  ListTile(
                    leading: Text(
                      'Hearing Status',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 8),
                  ListTile(
                    leading: Icon(Icons.calendar_month),
                    title: Text('Next Hearing'),
                    trailing: Text(hearingstatus),
                  ),
                  ListTile(
                    leading: Text(
                      'Previous Hearing Decision',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        judgeremarks,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),

                  SizedBox(height: 24),

                  // Add more widgets as needed for additional case information.
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:law_application/res/colors.dart';

// class casedetail extends StatefulWidget {
//   const casedetail({super.key});

//   @override
//   State<casedetail> createState() => _casedetailState();
// }

// class _casedetailState extends State<casedetail> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Case detail'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: Text(
//                 'hypothetical and value-based reasoning ',
//                 style: Theme.of(context).textTheme.headlineLarge?.copyWith(
//                     fontSize: 21,
//                     color: AppColors.primaryColor,
//                     fontWeight: FontWeight.bold),
//               ),
//             ),
//             SizedBox(
//               height: 15,
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.grey),
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Text(
//                           'Start date: 23-09-22',
//                           style: Theme.of(context).textTheme.bodyLarge,
//                         ),
//                         Text(
//                           'Case Number:123321',
//                           style: Theme.of(context).textTheme.bodyLarge,
//                         ),
//                       ],
//                     ),
//                     Text(
//                       'Case Description',
//                       style: Theme.of(context).textTheme.bodyLarge,
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
