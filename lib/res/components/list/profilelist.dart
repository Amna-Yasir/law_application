import 'package:flutter/material.dart';

import '../card/profilecard.dart';

class profilelist extends StatelessWidget {
  const profilelist({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        profilecard(
          LawyerName: 'Abu Hanif',
          lawyercategory: 'Divorce',
          imageurl:
              'https://images.unsplash.com/photo-1599834562135-b6fc90e642ca?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
          rating: '300+',
        ),
        SizedBox(
          width: 10,
        ),
        profilecard(
          LawyerName: 'Alis Akter',
          lawyercategory: 'Divorce',
          imageurl:
              'https://images.unsplash.com/photo-1581841064838-a470c740e8ee?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
          rating: '800+',
        ),
        SizedBox(
          width: 10,
        ),
        profilecard(
          LawyerName: 'Zara Ali',
          lawyercategory: 'Goverment',
          imageurl:
              'https://images.unsplash.com/photo-1603988089669-c041ac2fe196?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
          rating: '99+',
        ),
        SizedBox(
          width: 10,
        ),
        profilecard(
          LawyerName: 'Kim Jenner',
          lawyercategory: 'Sale',
          imageurl:
              'https://images.unsplash.com/photo-1582141011660-4f8a49ded25b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80',
          rating: '800+',
        ),
      ],
    );
  }
}
