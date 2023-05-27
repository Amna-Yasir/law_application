import 'package:flutter/material.dart';
import 'package:law_application/utils/routes/routesname.dart';
import 'package:law_application/views/Lawyer/lawyer%20dashboard/dashboardview.dart';
import 'package:law_application/views/Lawyer/lawyer%20dashboard/lawyer_profile.dart';
import 'package:law_application/views/Lawyer/lawyer%20signup/lawyersignup_screen.dart';

import 'package:law_application/views/client/dashboard/dashboardview.dart';
import 'package:law_application/views/client/dashboard/case_managment.dart';

import 'package:law_application/views/client/login/Auth/loginwithPhone.dart';
import 'package:law_application/views/client/login/Auth/verifycode.dart';
import 'package:law_application/views/user_manage.dart';

import '../../views/Lawyer/lawyer Login/lawyerlogin_screen.dart';
import '../../views/client/forgot password/forgot_screen.dart';
import '../../views/client/login/login_screen.dart';
import '../../views/client/signup/signup_screen.dart';
import '../../views/splashscreen/splashscreen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.usermanagerView:
        return MaterialPageRoute(builder: (_) => const usermanager());
      case RouteName.lawyerProfileView:
        return MaterialPageRoute(builder: (_) => const lawyerprofile());
      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (_) => const splashScreen());
      case RouteName.loginView:
        return MaterialPageRoute(builder: (_) => const loginscreen());
      case RouteName.lawyerloginView:
        return MaterialPageRoute(builder: (_) => const lawyerloginscreen());
      case RouteName.lawyersignupView:
        return MaterialPageRoute(builder: (_) => const lawyersignUpScreen());
      case RouteName.signUpView:
        return MaterialPageRoute(builder: (_) => const signUpScreen());
      case RouteName.forgotscreen:
        return MaterialPageRoute(builder: (_) => const forgotscreen());
      case RouteName.dashboardView:
        return MaterialPageRoute(builder: (_) => const dashboardView());
      case RouteName.lawyerdashboardView:
        return MaterialPageRoute(builder: (_) => const lawyerdashboardView());
      case RouteName.postView:
        return MaterialPageRoute(builder: (_) => const casemanagement());
      case RouteName.LoginWithPhoneNumber:
        return MaterialPageRoute(builder: (_) => const LoginwithPhonenumber());

      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
