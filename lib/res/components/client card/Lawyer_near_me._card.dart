import 'package:flutter/material.dart';

import '../../colors.dart';

class profilecard extends StatelessWidget {
  profilecard({
    super.key,
    required this.imageurl,
    required this.LawyerName,
    required this.lawyercategory,
    required this.finalRating,
    required this.ontap,
  });
  final String lawyercategory;
  final VoidCallback ontap;
  final String LawyerName;
  final String imageurl;
  final double finalRating;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: ontap,
            child: Stack(children: [
              Container(
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
                      lawyercategory + ' lawyer',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.purple),
                    ),
                    SizedBox(
                      width: 10,
                    ),
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
