import 'package:flutter/material.dart';

import '../../colors.dart';

class FullProfileCard extends StatelessWidget {
  const FullProfileCard({
    super.key,
    required this.workinghour,
    required this.imageUrl,
    required this.LawyerName,
    required this.location,
    required this.experience,
    required this.ontap,
  });

  final String workinghour;
  final String imageUrl;
  final String LawyerName;
  final String location;
  final String experience;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: InkWell(
          onTap: ontap,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(workinghour,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  color: Colors.deepOrange, fontSize: 11)),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(Icons.favorite_border_outlined,
                          size: 15, color: Colors.grey),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image(
                            fit: BoxFit.cover, image: NetworkImage(imageUrl)),
                      ),
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Text(
                    LawyerName,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 13),
                  ),
                  Text(
                    experience,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.purple, fontSize: 12),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 12,
                        color: Colors.purple,
                      ),
                      Text(
                        location,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.black, fontSize: 12),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
