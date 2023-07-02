import 'package:flutter/material.dart';
import 'package:law_application/views/Lawyer/lawyer%20dashboard/lawyer%20home%20screen/categorydetail.dart';

import '../card/categorycard.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            categorycard(
                ontap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => categorydetail()));
                },
                lawyercategory: 'Criminal',
                noOfLawyers: '400 lawyers',
                imageurl:
                    'https://freedomlaw.ca/wp-content/uploads/2018/08/criminal-defense.jpg'),
            SizedBox(
              width: 10,
            ),
            categorycard(
              ontap: () {},
              lawyercategory: 'Divorce',
              noOfLawyers: '200 lawyers',
              imageurl:
                  'https://www.startupguys.net/wp-content/uploads/2022/04/four-persons-having-a-discussion.png',
            ),
            SizedBox(
              width: 10,
            ),
            categorycard(
              lawyercategory: 'Govt',
              noOfLawyers: '20 lawyers',
              imageurl:
                  'https://www.thomsonreuters.com/en-us/posts/wp-content/uploads/sites/20/2022/11/pursuit-of-justice-gavel.jpg',
              ontap: () {},
            ),
            SizedBox(
              width: 10,
            ),
            categorycard(
              lawyercategory: 'Tax',
              noOfLawyers: '10 lawyers',
              imageurl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQC5WU0kyuoA-C5zRNsVabieBzyZMrEWJ44xpeKSgmHpjL1SCyP-SEdFO1HyfBMoSyIbs&usqp=CAU',
              ontap: () {},
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ));
  }
}
