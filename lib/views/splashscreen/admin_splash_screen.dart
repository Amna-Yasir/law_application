import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../res/fonts.dart';
import '../services/splash-services.dart';

class adminsplashScreen extends StatefulWidget {
  const adminsplashScreen({super.key});

  @override
  State<adminsplashScreen> createState() => _adminsplashScreenState();
}

// ignore: camel_case_types
class _adminsplashScreenState extends State<adminsplashScreen> {
  splashServices services = splashServices();
  @override
  void initState() {
    services.adminlogin(context);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
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
    );
  }
}
