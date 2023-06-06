import 'package:flutter/material.dart';

import '../../colors.dart';

class categorycard extends StatelessWidget {
  categorycard({
    super.key,
    required this.lawyercategory,
    required this.noOfLawyers,
    required this.imageurl,
  });
  final String lawyercategory;
  final String noOfLawyers;
  final String imageurl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              print('lawyer');
            },
            child: Container(
                color: Colors.white,
                height: 100,
                width: 150,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(image: NetworkImage(imageurl)))),
          ),
          Text(
            lawyercategory,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            noOfLawyers,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.purple),
          ),
        ],
      ),
    );
  }
}
