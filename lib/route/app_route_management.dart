
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_and_notification/presentation/screens/home_screen/home_screen.dart';
import 'package:login_and_notification/presentation/screens/login/login_screen.dart';
import 'package:login_and_notification/presentation/screens/signup/signup_screen.dart';
import 'package:login_and_notification/presentation/screens/splash_screen.dart';

class AppRoutes{

  static const String REGISTER = '/user_signup_page';
  static const String SPLASH = '/splash';
  static const String LOGIN = '/user_login_page';
  static const String HOME = '/home';


  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case SplashScreen.appRoute:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
        );

      case LOGIN:
        return MaterialPageRoute(
          builder: (_) => UserLoginScreen(),
        );

      case SPLASH:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
        );
      case REGISTER:
        return MaterialPageRoute(
          builder: (_) => UserSignupScreen(),
        );
        case HOME:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Sorry!! Page not found ${settings.name}'),
            ),
          ),
        );
    }
  }

  ///Singleton factory
  static final AppRoutes _instance = AppRoutes._internal();

  factory AppRoutes() {
    return _instance;
  }

  AppRoutes._internal();

}