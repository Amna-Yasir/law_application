import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../res/components/list/categoryList.dart';
import '../../../res/components/list/profilelist.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        centerTitle: true,
        title: Image.asset(
          'assets/images/Fav icon.png',
          height: 50,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Select Category',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 160,
                child: CategoryList(),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: (() {}),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'View All',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(fontSize: 15),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Lawyers Near me',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 170,
                child: profilelist(),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: (() {}),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'View All',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            fontSize: 15,
                          ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Popular Lawyer',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    FullProfileCard(
                      workinghour: '\$15.00/hr',
                      location: 'Lahore',
                      imageUrl:
                          'https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
                      experience: '14 Years Experience',
                      LawyerName: 'Leyla Erdem',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    FullProfileCard(
                      workinghour: '\$19.00/hr',
                      location: 'Islamabad',
                      imageUrl:
                          'https://images.unsplash.com/photo-1621784562877-e971f1f79f47?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                      experience: '19 Years Experience',
                      LawyerName: 'Zara Erdem',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    FullProfileCard(
                      workinghour: '\$20.00/hr',
                      location: 'Murree',
                      imageUrl:
                          'https://images.unsplash.com/photo-1605664041952-4a2855d9363b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80',
                      experience: '19 Years Experience',
                      LawyerName: 'Faisal Erdem',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    FullProfileCard(
                      workinghour: '\$16.00/hr',
                      location: 'Gujrat',
                      imageUrl:
                          'https://images.unsplash.com/photo-1662104935883-e9dd0619eaba?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
                      experience: '6 Years Experience',
                      LawyerName: 'Sara Khan',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

class FullProfileCard extends StatelessWidget {
  const FullProfileCard({
    super.key,
    required this.workinghour,
    required this.imageUrl,
    required this.LawyerName,
    required this.location,
    required this.experience,
  });

  final String workinghour;
  final String imageUrl;
  final String LawyerName;

  final String location;
  final String experience;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
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
                        ?.copyWith(color: Colors.deepOrange, fontSize: 11)),
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
                  child:
                      Image(fit: BoxFit.cover, image: NetworkImage(imageUrl)),
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
              style:
                  Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 13),
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
            RatingBarIndicator(
                rating: 5,
                itemSize: 11,
                itemBuilder: (context, index) {
                  return Icon(
                    Icons.star,
                    color: Colors.yellow,
                  );
                }),
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
    );
  }
}
