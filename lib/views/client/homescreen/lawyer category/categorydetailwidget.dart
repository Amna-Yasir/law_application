import 'package:flutter/material.dart';
import 'package:law_application/res/colors.dart';

class categoryDetailwidget extends StatelessWidget {
  const categoryDetailwidget({
    super.key,
    required this.LawyerName,
    required this.imageurl,
    required this.lawyeraddress,
    required this.ontap,
  });
  final String LawyerName;
  final String imageurl;
  final lawyeraddress;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            width: 300,
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
                              width: 400,
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
                  child: Row(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          LawyerName,
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 20,
                              color: Colors.purple,
                            ),
                            Text(
                              lawyeraddress,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: Colors.grey, fontSize: 18),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            VerticalDivider(
                              thickness: 1,
                              width: 20,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            TextButton(
                                onPressed: ontap,
                                child: Text('View profile',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                            decoration:
                                                TextDecoration.underline))),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
