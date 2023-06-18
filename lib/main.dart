import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:law_application/res/colors.dart';
import 'package:law_application/res/fonts.dart';
import 'package:law_application/utils/routes/routes.dart';
import 'package:law_application/utils/routes/routesname.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              timePickerTheme: TimePickerThemeData(
                  dayPeriodTextColor: AppColors.whiteColor,
                  dayPeriodColor: AppColors.primaryColor,
                  hourMinuteColor: AppColors.whiteColor,
                  dialBackgroundColor: AppColors.whiteColor,
                  dialHandColor: AppColors.primaryColor,
                  hourMinuteTextColor: AppColors.primaryColor),
              primarySwatch: AppColors.primaryMaterialColor,
              scaffoldBackgroundColor: Color.fromARGB(255, 255, 254, 254),
              appBarTheme: const AppBarTheme(
                  color: Color.fromARGB(255, 255, 254, 254),
                  centerTitle: true,
                  titleTextStyle: TextStyle(
                      fontSize: 22,
                      fontFamily: AppFonts.sfProDisplayMedium,
                      color: AppColors.primaryTextTextColor)),
              textTheme: const TextTheme(
                displayLarge: TextStyle(
                    fontSize: 40,
                    fontFamily: AppFonts.sfProDisplayMedium,
                    color: AppColors.primaryTextTextColor,
                    fontWeight: FontWeight.w500,
                    height: 1.6),
                displayMedium: TextStyle(
                    fontSize: 32,
                    fontFamily: AppFonts.sfProDisplayMedium,
                    color: AppColors.primaryTextTextColor,
                    fontWeight: FontWeight.w500,
                    height: 1.6),
                displaySmall: TextStyle(
                    fontSize: 28,
                    fontFamily: AppFonts.sfProDisplayMedium,
                    color: AppColors.primaryTextTextColor,
                    fontWeight: FontWeight.w500,
                    height: 1.9),
                headlineMedium: TextStyle(
                    fontSize: 24,
                    fontFamily: AppFonts.sfProDisplayMedium,
                    color: AppColors.primaryTextTextColor,
                    fontWeight: FontWeight.w500,
                    height: 1.6),
                headlineSmall: TextStyle(
                    fontSize: 20,
                    fontFamily: AppFonts.sfProDisplayMedium,
                    color: AppColors.primaryTextTextColor,
                    fontWeight: FontWeight.w500,
                    height: 1.6),
                titleLarge: TextStyle(
                    fontSize: 17,
                    fontFamily: AppFonts.sfProDisplayBold,
                    color: AppColors.primaryTextTextColor,
                    fontWeight: FontWeight.w700,
                    height: 1.6),
                bodyLarge: TextStyle(
                    fontSize: 17,
                    fontFamily: AppFonts.sfProDisplayBold,
                    color: AppColors.primaryTextTextColor,
                    fontWeight: FontWeight.w700,
                    height: 1.6),
                bodyMedium: TextStyle(
                    fontSize: 14,
                    fontFamily: AppFonts.sfProDisplayRegular,
                    color: AppColors.primaryTextTextColor,
                    fontWeight: FontWeight.w700,
                    height: 1.6),
                bodySmall: TextStyle(
                    fontSize: 12,
                    fontFamily: AppFonts.sfProDisplayBold,
                    color: AppColors.primaryTextTextColor,
                    fontWeight: FontWeight.w700,
                    height: 2.26),
              )),
          initialRoute: RouteName.usermanagerView,
          onGenerateRoute: Routes.generateRoute,
        );
      },
    );
  }
}
