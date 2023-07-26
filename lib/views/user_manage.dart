import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:law_application/res/components/roundbutton.dart';
import 'package:law_application/utils/routes/routesname.dart';
import 'package:law_application/views/services/splash-services.dart';
import 'package:law_application/views/splashscreen/admin_splash_screen.dart';

class usermanager extends StatefulWidget {
  const usermanager({super.key});

  @override
  State<usermanager> createState() => _usermanagerState();
}

class _usermanagerState extends State<usermanager> {
  splashServices Splashservices = splashServices();
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://images.unsplash.com/photo-1589391886645-d51941baf7fb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80'),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            roundButton(
                title: 'Continue as a lawyer',
                onpress: () {
                  Navigator.pushNamed(context, RouteName.lawyersplashScreen);
                }),
            SizedBox(
              height: 10,
            ),
            roundButton(
                title: 'Continue as a Client',
                onpress: () {
                  Navigator.pushNamed(context, RouteName.clientsplashScreen);
                }),
            SizedBox(
              height: 10,
            ),
            roundButton(
                title: 'Continue as a admin',
                onpress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => adminsplashScreen()));
                }),
          ],
        ),
      ),
    );
  }
}
