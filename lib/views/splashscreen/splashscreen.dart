import 'package:animate_gradient/animate_gradient.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../res/fonts.dart';
import '../services/splash-services.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  splashServices services = splashServices();
  @override
  void initState() {
    services.isLogin(context);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimateGradient(
        primaryBegin: Alignment.topLeft,
        primaryEnd: Alignment.bottomLeft,
        secondaryBegin: Alignment.bottomLeft,
        secondaryEnd: Alignment.topRight,
        primaryColors: [
          Colors.black,
          Colors.grey,
          Colors.white,
        ],
        secondaryColors: [
          Colors.white,
          Colors.black26,
          Colors.grey,
        ],
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/images/Law firm logo.png'),
                width: 300,
                height: 200,
              ),
              Center(
                child: Text(
                  'Your Legal Solution',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontFamily: AppFonts.sfProDisplayBold, fontSize: 15),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
