import 'package:flutter/material.dart';
import 'package:law_application/utils/routes/routesname.dart';
import 'package:law_application/views/Lawyer/lawyer%20dashboard/lawyer%20home%20screen/dashboardview.dart';
import 'package:law_application/views/Lawyer/lawyer%20dashboard/lawyer%20profile%20section/lawyer_other_information.dart';
import 'package:law_application/views/Lawyer/lawyer%20dashboard/lawyer%20profile%20section/lawyer_profile.dart';
import 'package:law_application/views/Lawyer/lawyer%20signup/lawyersignup_screen.dart';
import 'package:law_application/views/admin/admin%20login/admin_login_screen.dart';
import 'package:law_application/views/admin/admin%20signup/admin_signup_screen.dart';
import 'package:law_application/views/admin/admin_dashboard.dart';
import 'package:law_application/views/admin/profile%20module/admin_other_information.dart';
import 'package:law_application/views/splashscreen/clientSplashScreen.dart';
import 'package:law_application/views/user_manage.dart';

import '../../views/Lawyer/lawyer Login/lawyerlogin_screen.dart';
import '../../views/client/Case Managment Module/case_managment.dart';
import '../../views/client/Profile Module/basic_information.dart';
import '../../views/client/dashboard/ButtomNavbar.dart';
import '../../views/client/forgot password/forgot_screen.dart';
import '../../views/client/login/login_screen.dart';
import '../../views/client/signup/signup_screen.dart';
import '../../views/splashscreen/splashscreen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.usermanagerView:
        return MaterialPageRoute(builder: (_) => const usermanager());
      case RouteName.adminbasicInfo:
        return MaterialPageRoute(builder: (_) => const adminBasicInfo());

      case RouteName.admindashboardView:
        return MaterialPageRoute(builder: (_) => const admin_dashboard_View());
      case RouteName.clientbasicinfo:
        return MaterialPageRoute(builder: (_) => clientBasicInfo());
      case RouteName.lawyerProfileView:
        return MaterialPageRoute(builder: (_) => const lawyerprofile());
      case RouteName.lawyersplashScreen:
        return MaterialPageRoute(builder: (_) => const lawyersplashScreen());
      case RouteName.clientsplashScreen:
        return MaterialPageRoute(builder: (_) => const clientsplashScreen());
      case RouteName.clientloginView:
        return MaterialPageRoute(builder: (_) => const loginscreen());
      case RouteName.lawyerloginView:
        return MaterialPageRoute(builder: (_) => const lawyerloginscreen());
      case RouteName.lawyerotherInfo:
        return MaterialPageRoute(builder: (_) => const lawyerOtherInfo());
      case RouteName.adminloginView:
        return MaterialPageRoute(builder: (_) => const admin_loginscreen());
      case RouteName.adminsignupView:
        return MaterialPageRoute(builder: (_) => const admin_signUpScreen());

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
