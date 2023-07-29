import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:law_application/res/colors.dart';
import 'package:law_application/views/admin/All%20lawyers/lawyer_appointments.dart';
import 'package:law_application/views/admin/All%20lawyers/lawyer_cases.dart';
import 'package:law_application/views/admin/All%20lawyers/lawyer_profile.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class lawyerRecord extends StatefulWidget {
  const lawyerRecord({
    super.key,
    required this.username,
    required this.email,
    required this.phone,
    required this.address,
    required this.description,
    required this.category,
    required this.Userid,
    // required this.casenumber,
    // required this.casetitle,
    // required this.court,
    // required this.startingdate,
    // required this.opname,
    // required this.clientname,
    // required this.hearingstatus,
    // required this.judgeremarks,
  });

  final String username;
  final String email;
  final String phone;
  final String address;
  final String description;
  final String Userid;
  final String category;
  // final String casenumber;
  // final String casetitle;
  // final String court;
  // final String startingdate;
  // final String opname;
  // final String clientname;
  // final String hearingstatus;
  // final String judgeremarks;

  @override
  State<lawyerRecord> createState() => _lawyerRecordState();
}

class _lawyerRecordState extends State<lawyerRecord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  Stack(alignment: Alignment.bottomCenter, children: [
                    Container(
                      height: 140,
                      width: 140,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: Color(0xffD0CDF3), width: 7)),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child:
                              // provider.image == null
                              //  map['Profilepicture'].toString() == ''
                              //     ? const Icon(Icons.person)
                              //     :
                              Image(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://images.unsplash.com/photo-1597586124394-fbd6ef244026?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80'),
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return const Center(
                                  child: CircularProgressIndicator());
                            },
                          )
                          // : Image.file(
                          //     File(provider.image!.path).absolute,
                          //     fit: BoxFit.cover,
                          //   ),
                          ),
                    ),
                    InkWell(
                      onTap: () {
                        // provider
                        //     .pickimage(context);
                      },
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: AppColors.primaryColor,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    )
                  ]),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 6.0,
              ),
              child: SettingsContainer(
                  onTap: () {
                    PersistentNavBarNavigator.pushNewScreen(context,
                        screen: lawyerProfile(
                            username: widget.username,
                            email: widget.email,
                            phone: widget.phone,
                            address: widget.address,
                            description: widget.description,
                            Userid: widget.Userid,
                            category: widget.category));
                  },
                  withArrow: true,
                  child: Text(
                    'Profile',
                    style: Theme.of(context).textTheme.headlineSmall,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 6.0,
              ),
              child: SettingsContainer(
                  onTap: () {
                    PersistentNavBarNavigator.pushNewScreen(context,
                        screen: admin_view_of_cases(
                          lawyerid: widget.Userid,
                          // casenumber: widget.casenumber,
                          // casetitle: widget.casetitle,
                          // court: widget.court,
                          // startingdate: widget.startingdate,
                          // opname: widget.opname,
                          // clientname: widget.clientname,
                          // hearingstatus: widget.hearingstatus,
                          // judgeremarks: widget.judgeremarks,
                          // clientid: '',
                        ));
                  },
                  withArrow: true,
                  child: Text(
                    'Cases',
                    style: Theme.of(context).textTheme.headlineSmall,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: SettingsContainer(
                  onTap: () {
                    PersistentNavBarNavigator.pushNewScreen(context,
                        screen: admin_lawyer_appointment_check(
                          lawyerid: widget.Userid,
                          lawyername: widget.username,
                        ));
                  },
                  withArrow: true,
                  child: Text(
                    'Apointments',
                    style: Theme.of(context).textTheme.headlineSmall,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 6.0,
              ),
              child: SettingsContainer(
                  withArrow: true,
                  child: Text(
                    'Documents Verfication',
                    style: Theme.of(context).textTheme.headlineSmall,
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class SettingsContainer extends StatelessWidget {
  final bool withArrow;
  final Widget child;
  final Function()? onTap;

  SettingsContainer(
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
        height: 50,
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
