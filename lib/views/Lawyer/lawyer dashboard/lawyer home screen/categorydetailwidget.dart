import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:law_application/res/colors.dart';

class categoryDetailwidget extends StatelessWidget {
  const categoryDetailwidget({
    super.key,
    required this.LawyerName,
    required this.imageurl,
  });
  final String LawyerName;
  final String imageurl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 165,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 3,
                    blurRadius: 2,
                    offset: Offset(0, 3),
                  )
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5)),
                          child: Image(
                              height: 100,
                              width: 166,
                              fit: BoxFit.cover,
                              image: NetworkImage(imageurl))),
                    ),
                    Positioned(
                      top: 10,
                      right: 5,
                      child: Icon(
                        Icons.favorite_border_outlined,
                        size: 20,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LawyerName,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 12,
                            color: Colors.purple,
                          ),
                          Text(
                            'Islamabad',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                      Row(
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
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          RatingBarIndicator(
                            rating: 5,
                            itemSize: 10,
                            itemBuilder: (context, index) {
                              return Icon(
                                Icons.star,
                                color: Colors.yellow,
                              );
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '5',
                            style: TextStyle(fontSize: 10),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Container(
                            width: 40,
                            height: 15,
                            color: AppColors.primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Text(
                                'Book Now ',
                                style: TextStyle(
                                    fontSize: 8, color: AppColors.whiteColor),
                              ),
                            ),
                          ) //
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
