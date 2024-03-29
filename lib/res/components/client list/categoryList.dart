import 'package:flutter/material.dart';

import 'package:law_application/views/client/homescreen/lawyer%20category/CriminalCategorydetail.dart';
import 'package:law_application/views/client/homescreen/lawyer%20category/divorce_lawyer.dart';
import 'package:law_application/views/client/homescreen/lawyer%20category/govt_lawyers.dart';
import 'package:law_application/views/client/homescreen/lawyer%20category/tax_lawyer.dart';

import '../client card/categorycard.dart';

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
                          builder: (context) => C_CriminalCategorydetail()));
                },
                lawyercategory: 'Criminal',
                imageurl:
                    'https://freedomlaw.ca/wp-content/uploads/2018/08/criminal-defense.jpg'),
            SizedBox(
              width: 10,
            ),
            categorycard(
              ontap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => C_divorce_category()));
              },
              lawyercategory: 'Divorce',
              imageurl:
                  'https://www.startupguys.net/wp-content/uploads/2022/04/four-persons-having-a-discussion.png',
            ),
            SizedBox(
              width: 10,
            ),
            categorycard(
              lawyercategory: 'Govt',
              imageurl:
                  'https://www.thomsonreuters.com/en-us/posts/wp-content/uploads/sites/20/2022/11/pursuit-of-justice-gavel.jpg',
              ontap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => c_govt_category()));
              },
            ),
            SizedBox(
              width: 10,
            ),
            categorycard(
              lawyercategory: 'Tax',
              imageurl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQC5WU0kyuoA-C5zRNsVabieBzyZMrEWJ44xpeKSgmHpjL1SCyP-SEdFO1HyfBMoSyIbs&usqp=CAU',
              ontap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => c_tax_category()));
              },
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ));
  }
}
