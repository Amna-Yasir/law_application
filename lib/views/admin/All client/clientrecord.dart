import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:law_application/res/colors.dart';
import 'package:law_application/views/admin/All%20client/admin_client_profile.dart';
import 'package:law_application/views/admin/All%20client/client_appintment.dart';
import 'package:law_application/views/admin/All%20client/client_case.dart';
import 'package:law_application/views/admin/All%20client/clientsdocument.dart';

import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class clientRecord extends StatefulWidget {
  const clientRecord({
    super.key,
    required this.username,
    required this.email,
    required this.phone,
    required this.address,
    required this.Userid,
    required this.profilePicture,
  });

  final String username;
  final String email;
  final String phone;
  final String profilePicture;
  final String address;

  final String Userid;

  @override
  State<clientRecord> createState() => _clientRecordState();
}

class _clientRecordState extends State<clientRecord> {
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
                  Container(
                    height: 140,
                    width: 140,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Color(0xffD0CDF3), width: 7)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child:
                            // provider.image == null
                            //  map['Profilepicture'].toString() == ''
                            //     ? const Icon(Icons.person)
                            //     :
                            Image(
                          fit: BoxFit.cover,
                          image: NetworkImage(widget.profilePicture),
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
                        screen: admin_clientProfile(
                          username: widget.username,
                          email: widget.email,
                          phone: widget.phone,
                          address: widget.address,
                          Userid: widget.Userid,
                        ));
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
                        screen: admin_view_client_cases(
                          clientid: widget.Userid,
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
                        screen: admin_client_appointment_check(
                          clientid: widget.Userid,
                          clientname: widget.username,
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
                  onTap: () {
                    PersistentNavBarNavigator.pushNewScreen(context,
                        screen: documents(userid: widget.Userid));
                  },
                  withArrow: true,
                  child: Text(
                    'Documents Verfication',
                    style: Theme.of(context).textTheme.headlineSmall,
                  )),
            ),
            SizedBox(
              height: 20,
            ),
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
