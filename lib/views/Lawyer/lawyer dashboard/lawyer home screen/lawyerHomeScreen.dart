import 'package:flutter/material.dart';
import '../../../../res/components/list/categoryList.dart';
import '../../../../res/components/list/populartlawyerlist.dart';
import '../../../../res/components/list/profilelist.dart';

class lawyerhomescreen extends StatefulWidget {
  const lawyerhomescreen({super.key});

  @override
  State<lawyerhomescreen> createState() => _lawyerhomescreenState();
}

class _lawyerhomescreenState extends State<lawyerhomescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        centerTitle: true,
        title: Text('Lawyer'),
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
                child: popularlawyerlist(),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
