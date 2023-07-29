import 'package:flutter/material.dart';
import 'package:law_application/views/admin/All%20lawyers/lawyer_record.dart';

class lawyerProfile extends StatefulWidget {
  const lawyerProfile(
      {super.key,
      required this.username,
      required this.email,
      required this.phone,
      required this.address,
      required this.description,
      required this.Userid,
      required this.category});
  final String username;
  final String email;
  final String phone;
  final String address;
  final String description;
  final String Userid;
  final String category;

  @override
  State<lawyerProfile> createState() => _lawyerProfileState();
}

class _lawyerProfileState extends State<lawyerProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
            child: Column(
              children: [
                Text(
                  'Lawyer Profile Detail',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 5.0,
                            spreadRadius: 1.1)
                      ],
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Full Name',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                        SettingsContainer(
                            withArrow: false, child: Text(widget.username)),
                        Text(
                          'Email',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                        SettingsContainer(
                            withArrow: false, child: Text(widget.email)),
                        Text(
                          'Phone Number',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                        SettingsContainer(
                            withArrow: false, child: Text(widget.phone)),
                        Text(
                          'Address',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                        SettingsContainer(
                            withArrow: false, child: Text(widget.address)),
                        Text(
                          'Category',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                        SettingsContainer(
                            withArrow: false, child: Text(widget.category)),
                        Text(
                          'Description',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                        SettingsContainer(
                            withArrow: false, child: Text(widget.description))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
