import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:law_application/res/colors.dart';
import 'package:law_application/views/client/homescreen/case%20managment%20module/case_page.dart';
import 'package:law_application/views/services/session_manager.dart';

import '../../Lawyer/lawyer dashboard/lawyer appointment secreens/booking_screen.dart';

class client_lawyer_detail extends StatelessWidget {
  client_lawyer_detail({
    required this.lawyerName,
    super.key,
    required this.address,
    required this.rating,
    required this.about,
    required this.feeperhour,
    required this.phone,
    required this.currentlyWorking,
    required this.lawyerid,
    required this.imageUrl,
  });

  final String lawyerName;

  final String address;
  final double rating;
  final String about;
  final String feeperhour;
  final String phone;
  final String currentlyWorking;
  final String lawyerid;

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lawyer Profile'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade50,
                              blurRadius: 5,
                              spreadRadius: 2,
                              offset: Offset(4, 4))
                        ],
                      ),
                      // color: Colors.white,
                      height: 130,
                      width: 150,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image(
                              fit: BoxFit.cover,
                              image: NetworkImage(imageUrl))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            lawyerName,
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 12,
                                color: Colors.purple,
                              ),
                              Text(
                                address,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        color: Colors.black, fontSize: 12),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RatingBarIndicator(
                                rating: rating,
                                itemSize: 10,
                                itemBuilder: (context, index) {
                                  return Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  );
                                },
                              ),
                              Text(
                                rating.toString(),
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      '70',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Text(
                                      'Cases',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 18,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      '60',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Text(
                                      'Clients',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 18,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      '300',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Text(
                                      'Followers',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 80,
                      height: 50,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.primaryColor.withOpacity(0.2),
                                blurRadius: 2,
                                spreadRadius: 1,
                                offset: Offset(0, 4))
                          ],
                          color: AppColors.primaryColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(15)),
                      //
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.chat_bubble_rounded,
                            color: AppColors.primaryColor,
                          )),
                    ),
                    Container(
                      width: 80,
                      height: 50,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.lightGreen.withOpacity(0.2),
                                blurRadius: 2,
                                spreadRadius: 1,
                                offset: Offset(0, 4))
                          ],
                          color: Colors.lightGreen.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(15)),
                      //
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => C_casedescriptionpage(
                                          lawyerid: lawyerid,
                                          location: address,
                                          phonenumber: phone,
                                          username: lawyerName,
                                          Clientid: SessionController()
                                              .userid
                                              .toString(),
                                        )));
                          },
                          icon: Icon(
                            Icons.work,
                            color: Colors.lightGreen,
                          )),
                    ),
                    Container(
                      width: 80,
                      height: 50,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.blueAccent.withOpacity(0.2),
                                blurRadius: 2,
                                spreadRadius: 1,
                                offset: Offset(0, 4))
                          ],
                          color: Colors.blueAccent.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(15)),
                      //
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => bookingcalender(
                                        username: lawyerName,
                                        location: address,
                                        phonenumber: phone,
                                        lawyerid: lawyerid)));
                          },
                          icon: Icon(Icons.calendar_month_outlined,
                              color: Colors.blueAccent)),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'User Information',
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.start,
                ),
                Divider(
                  thickness: 2,
                  color: AppColors.dividedColor,
                ),
                ListTile(title: Text(about)),
                Divider(
                  thickness: 2,
                  color: AppColors.dividedColor,
                ),
                ListTile(
                  leading: Icon(Icons.currency_rupee),
                  title: Text('Hourly Rate'),
                  subtitle: Text(feeperhour),
                ),
                Divider(
                  thickness: 2,
                  color: AppColors.dividedColor,
                ),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text('Phone'),
                  subtitle: Text(phone),
                ),
                Divider(
                  thickness: 2,
                  color: AppColors.dividedColor,
                ),
                ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text('Location'),
                  subtitle: Text(address),
                ),
                Divider(
                  thickness: 2,
                  color: AppColors.dividedColor,
                ),
                ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text('Currently Working'),
                  subtitle: Text(currentlyWorking),
                ),
                Divider(
                  thickness: 2,
                  color: AppColors.dividedColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
