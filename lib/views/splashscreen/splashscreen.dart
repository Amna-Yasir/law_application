import 'package:animate_gradient/animate_gradient.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../res/fonts.dart';
import '../services/splash-services.dart';

class lawyersplashScreen extends StatefulWidget {
  const lawyersplashScreen({super.key});

  @override
  State<lawyersplashScreen> createState() => _lawyersplashScreenState();
}

// ignore: camel_case_types
class _lawyersplashScreenState extends State<lawyersplashScreen> {
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
        primaryColors: const [
          Colors.purple,
          Colors.deepPurple,
          Colors.white,
        ],
        secondaryColors: const [
          Colors.purple,
          Colors.deepPurple,
          Colors.white,
        ],
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
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
