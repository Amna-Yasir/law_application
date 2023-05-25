import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../colors.dart';

class profilecard extends StatelessWidget {
  profilecard(
      {super.key,
      required this.imageurl,
      required this.LawyerName,
      required this.lawyercategory,
      required this.rating});
  final String lawyercategory;
  final String LawyerName;
  final String imageurl;
  final String rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              print('lawyer');
            },
            child: Stack(children: [
              Container(
                color: Colors.white,
                height: 105,
                width: 130,
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5)),
                    child: Image(
                        fit: BoxFit.cover, image: NetworkImage(imageurl))),
              ),
              Positioned(
                top: 10,
                right: 5,
                child: Icon(
                  Icons.favorite_border_outlined,
                  size: 20,
                  color: AppColors.whiteColor,
                ),
              )
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LawyerName,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Row(
                  children: [
                    Text(
                      lawyercategory,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.purple),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Text(
                          rating,
                          style: TextStyle(fontSize: 10),
                        ),
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
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
