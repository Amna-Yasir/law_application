import 'package:flutter/material.dart';

import 'categorydetailwidget.dart';

class categorydetail extends StatefulWidget {
  const categorydetail({super.key});

  @override
  State<categorydetail> createState() => _categorydetailState();
}

class _categorydetailState extends State<categorydetail> {
  final serachfilter = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // FirebaseAuth auth = FirebaseAuth.instance;
    // DatabaseReference ref = FirebaseDatabase.instance.ref().child('lawyer');
    return Scaffold(
        appBar: AppBar(
          title: Text('Divorce Lawyers'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: serachfilter,
                    onChanged: (value) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                        hintText: 'Search',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)))),
                  ),
                ),
              ),
              Expanded(
                child: GridView.count(
                  padding: EdgeInsets.symmetric(vertical: 25),
                  mainAxisSpacing: 30,
                  crossAxisCount: 2,
                  children: [
                    Expanded(
                        child: categoryDetailwidget(
                      LawyerName: 'Ali Ahmed',
                      imageurl:
                          'https://images.unsplash.com/photo-1568602471122-7832951cc4c5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
                    )),
                    Expanded(
                        child: categoryDetailwidget(
                            LawyerName: 'Sara Ali',
                            imageurl:
                                'https://images.unsplash.com/photo-1603988089669-c041ac2fe196?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80')),
                    Expanded(
                        child: categoryDetailwidget(
                      LawyerName: 'Raja Ahmed',
                      imageurl:
                          'https://images.unsplash.com/photo-1564564244660-5d73c057f2d2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=876&q=80',
                    )),
                    Expanded(
                        child: categoryDetailwidget(
                      LawyerName: 'Erum Khalid',
                      imageurl:
                          'https://images.unsplash.com/photo-1564564295391-7f24f26f568b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=876&q=80',
                    )),
                    Expanded(
                        child: categoryDetailwidget(
                      LawyerName: 'Alia Ahmed',
                      imageurl:
                          'https://images.unsplash.com/photo-1509967419530-da38b4704bc6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=895&q=80',
                    )),
                    Expanded(
                        child: categoryDetailwidget(
                            LawyerName: 'Ali Rana',
                            imageurl:
                                'https://images.unsplash.com/photo-1607346256330-dee7af15f7c5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=906&q=80')),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
